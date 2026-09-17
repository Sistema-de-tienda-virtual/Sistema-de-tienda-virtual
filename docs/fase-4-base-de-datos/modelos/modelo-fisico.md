# Modelo físico de la base de datos — Fase 4

**Responsable:** Román Alberto Bolaños Cerquera
**Entregable asociado:** `scripts/01-crear-tablas.sql`
**Motor:** MySQL 8.0.16 o superior

## 1. Propósito y alcance

Este documento convierte el modelo lógico normalizado en un esquema físico concreto:
tipos de datos, longitudes, restricciones, índices y acciones referenciales. Integra en
un solo esquema los cuatro grupos de análisis del equipo, de modo que exista **un único
script de creación** y no cuatro scripts incompatibles.

Insumos utilizados:

| Insumo | Autor | Qué se tomó |
| ------ | ----- | ----------- |
| Modelo conceptual y lógico (usuarios, roles, recuperación, direcciones) | Iván y Juan | Entidades, atributos, claves, nulabilidad y reglas de integridad del componente de autenticación |
| Requerimientos Fase 2 | Equipo | RF-001 a RF-043 y reglas RN-G1 a RN-G6, RN-01 a RN-48 |
| Diagrama de clases Fase 3 | Equipo | Nombres de clases, atributos y enumeraciones internas |

## 2. Elección de motor

Se adopta **MySQL 8.0.16 o superior**. Tres razones:

- Es el gestor que el modelo lógico de Juan menciona como referencia.
- Desde 8.0.16 las restricciones `CHECK` se **aplican** de verdad; en versiones
  anteriores MySQL las acepta en el DDL y las ignora en silencio, lo que dejaría sin
  efecto reglas como «el precio debe ser mayor que cero».
- La colación `utf8mb4_0900_ai_ci` resuelve de forma nativa dos requisitos del proyecto
  sin código adicional (ver sección 4).

## 3. Convenciones de nomenclatura

| Aspecto | Regla | Ejemplo |
| ------- | ----- | ------- |
| Tablas | minúsculas, snake_case, **singular** | `item_pedido` |
| Columnas | minúsculas, snake_case, sin tildes ni eñe | `contrasena_hash` |
| Clave primaria | `id_<tabla>` | `id_producto` |
| Clave foránea | `id_<tabla_referenciada>` | `id_categoria` |
| Restricciones | `pk_`, `uq_`, `fk_`, `ck_`, `ix_` + contexto | `ck_producto_precio` |

La entidad lógica `RECUPERACION_CONTRASEÑA` se implementa como
`recuperacion_contrasena`: `CONTRIBUTING.md` exige nombres sin tildes ni caracteres
especiales, y una eñe en un identificador de base de datos es una fuente clásica de
problemas de codificación entre sistemas operativos.

## 4. Decisión de juego de caracteres y colación

La base se crea con `utf8mb4` y colación por defecto `utf8mb4_0900_ai_ci`
(*accent-insensitive, case-insensitive*). Esto no es un detalle cosmético: sostiene dos
requisitos directamente.

- **RF-015** — «buscar productos por nombre, sin distinguir mayúsculas ni tildes».
  Con esta colación, `WHERE nombre LIKE '%rosa%'` encuentra «Rosas» y «Rosás» sin
  funciones adicionales, y el índice sigue siendo utilizable.
- **RN-01 / RN-33** — correo único. El `UNIQUE` sobre `correo` rechaza
  `Ana@correo.com` si ya existe `ana@correo.com`, que es el comportamiento que espera la
  regla. Con una colación sensible a mayúsculas habría que normalizar en la aplicación y
  confiar en que nunca se olvide.

**Dos columnas se salen de esa regla a propósito:** `usuario.contrasena_hash` y
`recuperacion_contrasena.token` se declaran `CHARACTER SET ascii COLLATE ascii_bin`.
Un hash y un token deben compararse de forma exacta, byte a byte; compararlos ignorando
mayúsculas debilitaría la verificación.

## 5. Mapeo de dominios lógicos a tipos físicos

| Dominio lógico | Tipo MySQL | Por qué |
| -------------- | ---------- | ------- |
| Identificador de entidad transaccional | `BIGINT UNSIGNED AUTO_INCREMENT` | Crece sin techo práctico; `UNSIGNED` porque un id nunca es negativo |
| Identificador de catálogo pequeño | `SMALLINT UNSIGNED` / `TINYINT UNSIGNED` | Categorías, ocasiones, zonas y roles se cuentan por decenas; no se gasta espacio ni ancho de índice |
| Dinero | `DECIMAL(12,2)` | **Nunca `FLOAT` ni `DOUBLE`**: el redondeo binario haría que los totales no cuadren al centavo. 12 dígitos cubren hasta 9.999.999.999,99 |
| Porcentaje | `DECIMAL(5,2)` | Admite 0,01 a 100,00 con dos decimales |
| Texto corto | `VARCHAR(n)` con `n` ajustado | La longitud es parte de la regla: ver `mensaje_dedicatoria` abajo |
| Hash de contraseña | `VARCHAR(255) ascii_bin` | Cabe bcrypt (60) y argon2id (~100); 255 deja margen si se cambia de algoritmo (RN-04) |
| Token de recuperación | `CHAR(64) ascii_bin` | Longitud fija de un SHA-256 en hexadecimal |
| Estado / tipo cerrado | `ENUM(...)` | Ver sección 6 |
| Booleano | `BOOLEAN` (`TINYINT(1)`) | `utilizado`, `es_alta_demanda` |
| Fecha | `DATE` | `fecha_ingreso`, vigencias de promoción |
| Fecha y hora | `DATETIME` | Se prefiere a `TIMESTAMP`: no se ve afectado por cambios de zona horaria del servidor |
| Hora | `TIME` | Franjas de entrega |

Un caso donde el tipo **es** la restricción: `mensaje_dedicatoria VARCHAR(200)`.
RN-26 y RN-44 fijan el máximo en 200 caracteres, así que el propio tipo lo garantiza y
no hace falta un `CHECK` adicional.

## 6. Estados: `ENUM` en lugar de tablas de catálogo

Los estados (`usuario.estado`, `producto.estado`, `pedido.estado`, `movimiento_inventario.tipo`,
`transaccion.metodo_pago`, etc.) se implementan como `ENUM` y no como tablas con clave
foránea.

**A favor:** en el diagrama de clases de la Fase 3 estos valores están modelados como
enumeraciones internas de la clase, no como entidades; son conjuntos cerrados que solo
cambian si cambia el código; ahorran un `JOIN` en consultas muy frecuentes y el propio
motor rechaza un valor no previsto.

**En contra, y hay que saberlo:** agregar un valor nuevo exige un `ALTER TABLE`, y el
orden de los valores en un `ENUM` afecta al `ORDER BY`. Si más adelante el negocio
necesita administrar estados desde la interfaz, la decisión correcta será migrar a tablas
de catálogo. Para el alcance del MVP (R-09) el `ENUM` es la opción proporcionada.

## 7. Inventario de tablas

20 tablas, agrupadas por el reparto de análisis del equipo.

| # | Tabla | Grupo | Propósito |
| - | ----- | ----- | --------- |
| 1 | `rol` | Iván | Catálogo de roles |
| 2 | `usuario` | Iván | Cuentas registradas |
| 3 | `usuario_rol` | Iván | Resuelve el N:M usuario–rol |
| 4 | `recuperacion_contrasena` | Iván | Solicitudes de recuperación |
| 5 | `categoria` | Juan | Catálogo de categorías |
| 6 | `ocasion` | Juan | Catálogo de ocasiones |
| 7 | `producto` | Juan | Productos del catálogo |
| 8 | `producto_ocasion` | Juan | N:M producto–ocasión |
| 9 | `promocion` | Juan | Promociones por temporada |
| 10 | `promocion_producto` | Juan | N:M promoción–producto |
| 11 | `solicitud_arreglo_personalizado` | Juan | Solicitudes de arreglo a medida |
| 12 | `carrito` | Román | Carrito por cuenta |
| 13 | `item_carrito` | Román | Líneas del carrito |
| 14 | `movimiento_inventario` | Román | Entradas, ventas y mermas |
| 15 | `zona_cobertura` | Stiven | Zonas de entrega |
| 16 | `franja_horaria` | Stiven | Franjas con cupo |
| 17 | `pedido` | Stiven | Pedidos |
| 18 | `direccion_entrega` | Iván | Dirección histórica del pedido |
| 19 | `item_pedido` | Stiven | Líneas del pedido con precio congelado |
| 20 | `transaccion` | Stiven | Pagos simulados |

## 8. Acciones referenciales: el criterio

Toda clave foránea declara `ON DELETE` y `ON UPDATE`, como exige el README de la fase.
El criterio no es uniforme, y la razón es que el negocio distingue entre **datos
dependientes** e **historial**:

- **`CASCADE`** cuando la fila hija no tiene sentido sin la padre y no es historial:
  las asignaciones de rol de una cuenta borrada, los ítems de un carrito borrado, la
  dirección y los ítems de un pedido borrado.
- **`RESTRICT`** cuando borrar la fila padre destruiría historial o dejaría huecos en un
  reporte: no se puede borrar un producto que aparece en pedidos o movimientos
  (RN-16, RN-39), ni un rol asignado, ni una zona con direcciones registradas (RN-23),
  ni una cuenta que compró.
- **`SET NULL`** en un único caso: `pedido.id_repartidor`. Si se da de baja la cuenta de
  un repartidor, el pedido debe seguir existiendo y simplemente queda sin asignar
  (RF-034).

`ON UPDATE CASCADE` en todas: son claves artificiales que no deberían cambiar nunca, pero
si alguna vez hay que corregir una, la corrección debe propagarse sola.

| Tabla hija | FK | Tabla padre | ON DELETE | Motivo |
| ---------- | -- | ----------- | --------- | ------ |
| `usuario_rol` | `id_usuario` | `usuario` | CASCADE | Las asignaciones mueren con la cuenta |
| `usuario_rol` | `id_rol` | `rol` | RESTRICT | Un rol en uso se reasigna antes de borrarse |
| `recuperacion_contrasena` | `id_usuario` | `usuario` | CASCADE | Las solicitudes no sobreviven a la cuenta |
| `producto` | `id_categoria` | `categoria` | RESTRICT | Las categorías se desactivan, no se borran |
| `producto_ocasion` | `id_producto` | `producto` | CASCADE | Etiqueta, no historial |
| `producto_ocasion` | `id_ocasion` | `ocasion` | RESTRICT | No se borra una ocasión en uso |
| `promocion_producto` | ambas | `promocion`, `producto` | CASCADE | Vínculo temporal de campaña |
| `solicitud_arreglo_personalizado` | `id_usuario` | `usuario` | RESTRICT | Historial comercial |
| `carrito` | `id_usuario` | `usuario` | CASCADE | El carrito es estado de sesión, no historial |
| `item_carrito` | `id_carrito` | `carrito` | CASCADE | Línea dependiente |
| `item_carrito` | `id_producto` | `producto` | RESTRICT | Coherente con RN-16 |
| `pedido` | `id_comprador` | `usuario` | RESTRICT | Historial de ventas (RF-041) |
| `pedido` | `id_repartidor` | `usuario` | SET NULL | El pedido queda sin asignar (RF-034) |
| `pedido` | `id_franja` | `franja_horaria` | RESTRICT | No se borra una franja con pedidos |
| `direccion_entrega` | `id_pedido` | `pedido` | CASCADE | Es parte de la foto del pedido |
| `direccion_entrega` | `id_zona` | `zona_cobertura` | RESTRICT | RN-23 |
| `item_pedido` | `id_pedido` | `pedido` | CASCADE | Línea dependiente |
| `item_pedido` | `id_producto` | `producto` | RESTRICT | RF-042 necesita el producto |
| `transaccion` | `id_pedido` | `pedido` | CASCADE | Pago dependiente del pedido |
| `movimiento_inventario` | `id_producto` | `producto` | RESTRICT | RN-16 / RN-39 |
| `movimiento_inventario` | `id_usuario` | `usuario` | RESTRICT | Auditoría: quién registró |
| `movimiento_inventario` | `id_pedido` | `pedido` | RESTRICT | Trazabilidad de la venta |

## 9. Restricciones únicas que implementan cardinalidades

Tres `UNIQUE` no son validaciones sino la forma física de una cardinalidad del modelo:

| Restricción | Cardinalidad que materializa |
| ----------- | ---------------------------- |
| `uq_direccion_pedido` en `direccion_entrega(id_pedido)` | El 1:1 entre `pedido` y `direccion_entrega` |
| `uq_carrito_usuario` en `carrito(id_usuario)` | El «posee 0..1» del diagrama de clases: una cuenta, un carrito |
| `pk_usuario_rol(id_usuario, id_rol)` | Impide asignar dos veces el mismo rol a una cuenta |

## 10. Índices y el requisito que atiende cada uno

Además de los índices que MySQL crea solo (claves primarias, únicas y el primer campo de
cada FK), se declararon estos:

| Índice | Tabla | Requisito |
| ------ | ----- | --------- |
| `ix_producto_estado_categoria` | `producto` | RF-016, RN-07: catálogo público filtrado por categoría |
| `ix_producto_nombre` | `producto` | RF-015: búsqueda por nombre |
| `ix_producto_estado_precio` | `producto` | RF-017: filtro por rango de precio |
| `ix_pedido_estado_fecha` | `pedido` | RF-032, RF-043: gestión y reporte por estado |
| `ix_pedido_comprador` | `pedido` | RF-029: historial del cliente |
| `ix_pedido_repartidor` | `pedido` | RF-035: el repartidor ve solo los suyos |
| `ix_movimiento_producto_fecha` | `movimiento_inventario` | RF-037: movimientos por producto |
| `ix_movimiento_tipo_fecha` | `movimiento_inventario` | RF-040: consulta de mermas por periodo |
| `ix_recuperacion_usuario_vigencia` | `recuperacion_contrasena` | RF-005: buscar la solicitud vigente |
| `ix_promocion_vigencia` | `promocion` | RF-014, RF-022: promociones vigentes al calcular el total |
| `ix_franja_fecha` | `franja_horaria` | RF-024: franjas disponibles de una fecha |

Se evitó indexar de más: cada índice acelera lecturas pero encarece cada `INSERT` y
`UPDATE`, y en las tablas de líneas (`item_pedido`, `item_carrito`) el volumen de
escritura es el que manda.

## 11. Reglas que no son declarativas

Esta sección es la más importante para el resto del equipo. **Cuatro reglas del
documento de requerimientos no se pueden expresar en el DDL** y tienen que quedar en la
capa de aplicación o en disparadores. Conviene que estén escritas para que nadie asuma
que la base las está garantizando.

| Regla | Por qué no es declarativa | Vía propuesta |
| ----- | ------------------------- | ------------- |
| **RN-19 / RN-42** — un producto solo puede tener una promoción activa a la vez | Depende de que no se solapen rangos de fechas entre filas distintas. Un `UNIQUE` compara valores, no intervalos | Disparador `BEFORE INSERT`/`BEFORE UPDATE` en `promocion_producto`, o validación en la capa de servicio antes de asociar |
| **RN-28 / RN-46** — todo pedido tiene al menos una transacción | Es una cardinalidad mínima 1..N. Al insertar el pedido la transacción todavía no existe; MySQL no tiene restricciones diferidas | Transacción SQL que inserte pedido y pago como una sola unidad atómica |
| **RN-29** — el ciclo de estados del pedido | Un `ENUM` limita *qué* valores son válidos, no *desde qué* estado se puede pasar a cuál | Disparador `BEFORE UPDATE` sobre `pedido.estado` o máquina de estados en la aplicación |
| **RN-G4 / RN-38** — el stock se descuenta al confirmar el pedido, vía movimiento | Requiere coordinar tres tablas en un mismo acto | Procedimiento almacenado o transacción de servicio: insertar `item_pedido`, insertar `movimiento_inventario` tipo `VENTA` y actualizar `producto.stock_actual` |

Lo que el DDL **sí** garantiza y conviene no duplicar en código: precio mayor que cero
(RN-09), stock nunca negativo (RN-G3), cantidad mínima de 1 por ítem (RN-11), dedicatoria
de máximo 200 caracteres (RN-26), motivo obligatorio en la merma (RN-G5), cupo utilizado
que no excede el máximo (RN-24), vigencia de recuperación posterior a su generación
(RN-34) y precio de cotización coherente con el estado de la solicitud (RN-18).

## 12. Divergencias entre los insumos que hay que resolver en equipo

Al integrar los tres insumos aparecieron inconsistencias. Las resolví para poder entregar
un script ejecutable, pero **la decisión final es del equipo** y hay que dejar los
documentos de las fases anteriores alineados.

| # | Divergencia | Qué hice en el modelo físico | Qué falta decidir |
| - | ----------- | ---------------------------- | ----------------- |
| 1 | `usuario.estado`: Iván y Juan definen ACTIVO / DESACTIVADO / BLOQUEADO; el diagrama de clases de la Fase 3 dice ACTIVO / BLOQUEADO / INACTIVO | Seguí a Iván y Juan, por ser el insumo directo de esta fase | Corregir el diagrama de clases o el modelo lógico para que coincidan |
| 2 | La dirección de entrega: en el diagrama de clases es un atributo `direccionEntrega: String` dentro de `Pedido`; Iván y Juan la normalizan como entidad propia con barrio, ciudad, referencia y zona | Seguí la versión normalizada: `pedido` no tiene columna de dirección | Actualizar el diagrama de clases de la Fase 3 |
| 3 | `ciudad` en `direccion_entrega`: Juan advierte que si `zona_cobertura` determina una única ciudad, habría dependencia transitiva | La conservé como fotografía histórica de la entrega | Si se decide que la zona fija la ciudad, mover `ciudad` a `zona_cobertura` |
| 4 | La fecha de entrega: el diagrama de clases no la separa de la franja | No se repite en `pedido`; se obtiene de `franja_horaria.fecha`, para no introducir dependencia transitiva | Confirmar que ningún caso de uso necesita una fecha de entrega distinta a la de la franja |
| 5 | `franja_horaria.cupo_utilizado` es un dato derivado: se podría calcular contando los pedidos de la franja | Lo mantuve porque viene del diagrama de clases y hace directa la validación de cupo | Aceptar que es una desnormalización deliberada y mantenerla sincronizada con disparador, o eliminarla y calcularla |
| 6 | `movimiento_inventario` en el diagrama de clases no registra quién hizo el movimiento ni de qué pedido salió | Agregué `id_usuario` (auditoría, RF-037/RF-040) e `id_pedido` (trazabilidad de la venta, RF-038) | Validar estas dos columnas añadidas |
| 7 | La Fase 2 repite reglas con dos identificadores (RN-17/RN-40, RN-19/RN-42, RN-26/RN-44, RN-27/RN-45, RN-28/RN-46, RN-06/RN-36, RN-07/RN-37, RN-15/RN-38, RN-16/RN-39, RN-21/RN-43) | Implementé una sola regla efectiva y cité ambos identificadores | Nada: el propio documento de Fase 2 ya explica que la duplicación es para trazabilidad histórica |

## 13. Cómo ejecutar y verificar

```bash
mysql -u root -p --default-character-set=utf8mb4 < docs/fase-4-base-de-datos/scripts/01-crear-tablas.sql
```

> **`--default-character-set=utf8mb4` no es opcional.** Sin ese parámetro el cliente
> `mysql` puede leer el archivo como latin1 y guardar las tildes doblemente codificadas:
> «Rosás» se almacena como «RosÃ¡s» y las búsquedas de RF-015 dejan de encontrarlo,
> aunque la columna esté bien definida. Esto se detectó probando el script y aplica
> también a `02-datos-prueba.sql`.

Verificación mínima después de ejecutarlo:

```sql
USE floristeria_db;
-- Deben aparecer 20 tablas
SHOW TABLES;
-- Toda tabla con clave primaria
SELECT t.table_name
FROM information_schema.tables t
LEFT JOIN information_schema.table_constraints c
  ON c.table_schema = t.table_schema
 AND c.table_name = t.table_name
 AND c.constraint_type = 'PRIMARY KEY'
WHERE t.table_schema = 'floristeria_db' AND c.constraint_name IS NULL;
-- Toda FK con accion declarada (ninguna en NO ACTION)
SELECT constraint_name, table_name, delete_rule, update_rule
FROM information_schema.referential_constraints
WHERE constraint_schema = 'floristeria_db';
```

## 14. Entrega y siguientes pasos

Lo que queda listo con esta entrega:

- Modelo físico documentado: tipos, longitudes, restricciones, índices y acciones
  referenciales, con trazabilidad a los RF y RN.
- `scripts/01-crear-tablas.sql` con las 20 tablas en un único script, ejecutable en orden
  y desde cero.

Lo que depende de otros integrantes:

- **Stiven** — `02-datos-prueba.sql` y `03-consultas.sql`. Al cargar datos hay que
  respetar el orden de dependencias del script (catálogos antes de productos, pedido
  antes de dirección e ítems). Para el diccionario de datos, las secciones 5 a 10 de este
  documento traen los tipos y restricciones ya descritos.
- **Equipo** — los siete puntos de la sección 12, sobre todo el 1 y el 2, que exigen
  corregir el diagrama de clases de la Fase 3.
- **Pendiente propio** — exportar el diagrama del modelo físico como imagen y dejar el
  `.drawio` fuente en esta carpeta, según pide el README de la fase.
