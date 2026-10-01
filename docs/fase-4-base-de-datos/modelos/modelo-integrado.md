# Modelo integrado de base de datos

**Sistema de Tienda Virtual para Floristería** — Fase 4, Base de datos

Documento unificado de entidades, atributos, claves y relaciones.
Integración de los aportes de Iván, Juan, Steven y Román.
Fecha de consolidación: 16 de septiembre de 2026.

## 1. Propósito del documento

Este documento consolida en un único modelo conceptual/lógico de referencia los cuatro aportes de la Fase 4 relacionados con usuarios y seguridad, catálogo, inventario y carrito, y pedidos, pagos y entrega. El objetivo es disponer de una estructura coherente para la posterior construcción del modelo físico y del script de base de datos.

Se conservaron las entidades, atributos, reglas y relaciones presentes en los documentos fuente. Cuando los aportes tenían una decisión pendiente o una duplicidad que impedía una integración coherente, se tomó una decisión de integración explícita y se documentó en la sección 2.

## 2. Decisiones de integración y correcciones realizadas

| Tema | Decisión integrada |
| --- | --- |
| Stock del producto | El aporte de Juan incluye stock_actual y umbral_stock_minimo en PRODUCTO, mientras que Román propone INVENTARIO como entidad independiente. Para evitar duplicar el mismo dato, el modelo integrado mantiene INVENTARIO y retira esos dos atributos de PRODUCTO. PRODUCTO conserva los datos comerciales; INVENTARIO conserva el estado de existencias. |
| Clave de INVENTARIO | id_producto es simultáneamente PK y FK hacia PRODUCTO, materializando una relación 1:1. |
| ITEM_PEDIDO | Se adopta id_item_pedido como PK propia, y además una restricción lógica de unicidad sobre (id_pedido, id_producto) para evitar que el mismo producto aparezca dos veces dentro de un pedido. |
| DIRECCION_ENTREGA | Se mantiene id_direccion_entrega como PK. id_pedido funciona como FK y debe ser UNIQUE para materializar la relación 1:1 con PEDIDO. |
| PEDIDO | Se integran id_usuario, id_franja_horaria e id_direccion_entrega como referencias necesarias para comprador, franja y dirección de entrega. Se incorpora id_repartidor como FK nullable para registrar la asignación del repartidor, y fecha_hora_entrega_real como dato nullable para conservar la fecha y hora efectiva de entrega. |
| MOVIMIENTO_INVENTARIO | Se mantienen id_usuario e id_pedido como FKs. id_pedido es nullable porque ENTRADA y MERMA no provienen de un pedido; VENTA sí debe estar vinculada a un pedido. |
| PAGO | Se adopta id_pago como PK y id_pedido como FK. La relación es PEDIDO 1:N PAGO, manteniendo la regla de al menos una transacción por pedido. |
| FRANJA_HORARIA | Se mantiene como entidad independiente con PK id_franja_horaria. El control de cupos por fecha concreta queda como regla de aplicación/modelo lógico posterior, porque la documentación fuente no define una entidad específica para excepciones de alta demanda. |
| Datos derivados | No se almacena como dato base el total del carrito ni el subtotal del ítem de carrito. En ITEM_PEDIDO se conserva precio_unitario porque representa el precio vigente al confirmar y permite mantener el valor histórico de la compra. |

## 3. Inventario general de entidades

| # | Entidad | Propósito |
| --- | --- | --- |
| 1 | USUARIO | Cuentas de clientes, empleados, repartidores y administradores. |
| 2 | ROL | Funciones que puede desempeñar una cuenta. |
| 3 | USUARIO_ROL | Asociación N:M entre usuarios y roles. |
| 4 | RECUPERACION_CONTRASEÑA | Solicitudes seguras de recuperación de acceso. |
| 5 | CATEGORIA | Clasificación de productos. |
| 6 | PRODUCTO | Artículo ofrecido por la floristería. |
| 7 | OCASION | Motivo de compra utilizado para filtrar productos. |
| 8 | PROMOCION | Descuentos con periodo de vigencia. |
| 9 | PRODUCTO_OCASION | Asociación N:M entre productos y ocasiones. |
| 10 | PRODUCTO_PROMOCION | Asociación N:M entre productos y promociones. |
| 11 | INVENTARIO | Stock actual y umbral mínimo por producto. |
| 12 | MOVIMIENTO_INVENTARIO | Bitácora de entradas, ventas y mermas. |
| 13 | CARRITO | Compra en curso de un usuario. |
| 14 | ITEM_CARRITO | Producto y cantidad dentro del carrito. |
| 15 | PEDIDO | Compra confirmada y su información de entrega. |
| 16 | ITEM_PEDIDO | Producto, cantidad y precio congelado de un pedido. |
| 17 | PAGO | Transacciones de pago simulado. |
| 18 | ZONA | Zona configurada para cobertura de entrega. |
| 19 | DIRECCION_ENTREGA | Dirección asociada a un pedido y validada por zona. |
| 20 | FRANJA_HORARIA | Intervalo de entrega con cupo máximo. |

## 4. Diccionario de datos consolidado

Las siguientes tablas representan la versión integrada. PK = clave primaria; FK = clave foránea; UQ = restricción de unicidad.

### USUARIO

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_usuario | Identificador único del usuario. | PK | No |
| nombre | Nombre utilizado para el registro. | — | No |
| correo | Correo electrónico de acceso. | UQ | No |
| contrasena_hash | Contraseña almacenada como hash adaptativo con sal. | — | No |
| estado | ACTIVO, DESACTIVADO o BLOQUEADO temporalmente. | — | No |
| intentos_fallidos | Cantidad consecutiva de intentos de acceso inválidos. | — | No |
| bloqueado_hasta | Momento hasta el cual permanece el bloqueo temporal. | — | Sí |

### ROL

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_rol | Identificador único del rol. | PK | No |
| nombre | Nombre del rol, por ejemplo Cliente, Empleado, Repartidor o Administrador. | UQ | No |
| descripcion | Descripción de la función asociada. | — | Sí |

### USUARIO_ROL

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_usuario | Usuario al que se asigna el rol. | PK, FK | No |
| id_rol | Rol asignado al usuario. | PK, FK | No |

### RECUPERACION_CONTRASEÑA

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_recuperacion | Identificador único de la solicitud. | PK | No |
| id_usuario | Usuario asociado. | FK | No |
| token | Código o enlace seguro de validación. | UQ | No |
| fecha_generacion | Fecha y hora de generación. | — | No |
| fecha_expiracion | Fecha y hora de expiración; 30 minutos después de generarse. | — | No |
| utilizado | Indica si el enlace ya fue utilizado. | — | No |

### CATEGORIA

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_categoria | Identificador autogenerado de la categoría. | PK | No |
| nombre | Nombre normalizado y único de la categoría. | UQ | No |
| estado | ACTIVA o INACTIVA. | — | No |

### PRODUCTO

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_producto | Identificador autogenerado del producto. | PK | No |
| id_categoria | Categoría a la que pertenece. | FK | No |
| nombre | Nombre comercial. | — | No |
| descripcion | Descripción visible en el catálogo. | — | No |
| precio | Precio comercial; debe ser mayor que cero. | — | No |
| fecha_ingreso | Fecha de entrada inicial. | — | No |
| vida_util_estimada_dias | Vida útil estimada en días; debe ser mayor que cero cuando se informe. Puede quedar NULL si aún no se ha definido. | — | Sí |
| estado | ACTIVO o INACTIVO. | — | No |

### OCASION

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_ocasion | Identificador autogenerado de la ocasión. | PK | No |
| nombre | Nombre normalizado y único. | UQ | No |
| estado | ACTIVA o INACTIVA. | — | No |

### PROMOCION

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_promocion | Identificador autogenerado. | PK | No |
| descripcion | Descripción de la promoción. | — | No |
| porcentaje_descuento | Descuento mayor que 0 y máximo 100. | — | No |
| fecha_inicio | Inicio de vigencia. | — | No |
| fecha_fin | Fin de vigencia; igual o posterior a fecha_inicio. | — | No |
| estado | ACTIVA, INACTIVA o FINALIZADA. | — | No |

### PRODUCTO_OCASION

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_producto | Producto asociado. | PK, FK | No |
| id_ocasion | Ocasión asociada. | PK, FK | No |

### PRODUCTO_PROMOCION

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_producto | Producto asociado. | PK, FK | No |
| id_promocion | Promoción asociada. | PK, FK | No |

### INVENTARIO

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_producto | Producto al que corresponde el registro de stock. | PK, FK | No |
| stock_actual | Unidades disponibles; inicia en 0 y nunca puede ser negativo. | — | No |
| umbral_stock_minimo | Cantidad por debajo de la cual se genera alerta; NULL significa sin alerta. | — | Sí |

### MOVIMIENTO_INVENTARIO

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_movimiento | Identificador único del movimiento. | PK | No |
| id_producto | Producto cuyo stock se modifica. | FK | No |
| id_usuario | Usuario que registró el movimiento. | FK | No |
| id_pedido | Pedido que originó la salida cuando el tipo es VENTA. | FK | Sí |
| tipo | ENTRADA, VENTA o MERMA. | — | No |
| cantidad | Cantidad positiva de unidades movidas. | — | No |
| fecha | Fecha y hora del movimiento. | — | No |
| motivo | Razón del movimiento; obligatoria para MERMA. | — | Sí |

### CARRITO

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_carrito | Identificador único del carrito. | PK | No |
| id_usuario | Usuario propietario; máximo un carrito por usuario. | FK, UQ | No |
| fecha_creacion | Fecha y hora de creación. | — | No |

### ITEM_CARRITO

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_item_carrito | Identificador único de la línea. | PK | No |
| id_carrito | Carrito al que pertenece. | FK | No |
| id_producto | Producto agregado. | FK | No |
| cantidad | Cantidad entera, mínima 1 y no superior al stock disponible al modificar. | — | No |

### PEDIDO

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_pedido | Identificador único del pedido. | PK | No |
| id_usuario | Usuario comprador. | FK | No |
| nombre_comprador | Nombre del comprador conservado para la compra. | — | No |
| nombre_destinatario | Nombre del destinatario, que puede ser diferente del comprador. | — | No |
| fecha_entrega | Fecha solicitada para la entrega. | — | No |
| id_franja_horaria | Franja seleccionada. | FK | No |
| dedicatoria | Mensaje opcional; máximo 200 caracteres. | — | Sí |
| estado | Estado del ciclo de vida del pedido. | — | No |
| total | Total del pedido; se conserva como valor histórico al confirmar, si el equipo decide persistirlo. | Derivado/decisión | No |
| id_direccion_entrega | Dirección asociada al pedido. | FK, UQ | No |
| id_repartidor | Usuario con rol Repartidor asignado al pedido; puede ser NULL mientras no exista asignación. | FK | Sí |
| fecha_hora_entrega_real | Fecha y hora real registrada cuando el pedido se marca como Entregado; NULL mientras no se complete la entrega. | — | Sí |

CARRITO — Cardinalidad con USUARIO: se representa como USUARIO 0..1 CARRITO. Los requerimientos establecen que cada usuario tiene como máximo un carrito; por ello el carrito es opcional para el usuario, mientras que cada CARRITO pertenece obligatoriamente a un único USUARIO mediante id_usuario (FK, UNIQUE).

### ITEM_PEDIDO

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_item_pedido | Identificador único del ítem. | PK | No |
| id_pedido | Pedido al que pertenece. | FK | No |
| id_producto | Producto comprado. | FK | No |
| cantidad | Cantidad solicitada. | — | No |
| precio_unitario | Precio vigente al momento de confirmar; queda congelado para el historial. | — | No |
| subtotal | Cantidad × precio_unitario; puede calcularse a partir de los valores anteriores. | Derivado | — |

### PAGO

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_pago | Identificador único de la transacción. | PK | No |
| id_pedido | Pedido asociado. | FK | No |
| monto | Monto de la transacción. | — | No |
| metodo | Método de pago simulado. | — | No |
| fecha_hora | Fecha y hora de la transacción. | — | No |
| estado | Resultado de la transacción simulada. | — | No |

### ZONA

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_zona | Identificador único de la zona. | PK | No |
| nombre | Nombre de identificación de la zona. | — | No |
| estado | Disponibilidad de cobertura. | — | No |

### DIRECCION_ENTREGA

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_direccion_entrega | Identificador único de la dirección. | PK | No |
| id_pedido | Pedido al que corresponde la dirección. | FK, UQ | No |
| direccion | Dirección física de entrega. | — | No |
| barrio | Barrio de la entrega. | — | No |
| ciudad | Ciudad de la entrega. | — | No |
| referencia | Información adicional para facilitar la ubicación. | — | Sí |
| id_zona | Zona de cobertura a la que pertenece la dirección. | FK | No |

### FRANJA_HORARIA

| Atributo | Descripción | Clave | Nulo |
| --- | --- | --- | --- |
| id_franja_horaria | Identificador único de la franja. | PK | No |
| hora_inicio | Hora inicial del intervalo. | — | No |
| hora_fin | Hora final del intervalo. | — | No |
| cupo_maximo | Máximo de pedidos permitidos. | — | No |
| estado | Disponibilidad para selección. | — | No |

Nota: la notación 0..1 significa que la relación es opcional desde el lado de USUARIO: un usuario puede no tener carrito o tener uno, pero nunca más de uno. Esto se deriva de la regla de negocio que establece como máximo un carrito por usuario.

## 5. Relaciones y cardinalidades del modelo integrado

| Origen | Card. | Destino | Descripción |
| --- | --- | --- | --- |
| USUARIO | 1:N | USUARIO_ROL | Un usuario puede tener uno o varios roles. |
| ROL | 1:N | USUARIO_ROL | Un rol puede asignarse a varios usuarios. |
| USUARIO | 1:N | RECUPERACION_CONTRASEÑA | Un usuario puede generar varias solicitudes. |
| USUARIO | 0..1 | CARRITO | Un usuario puede tener cero o un carrito; como máximo uno. |
| USUARIO | 1:N | MOVIMIENTO_INVENTARIO | Un usuario puede registrar muchos movimientos. |
| USUARIO | 1:N | PEDIDO | Un usuario puede realizar muchos pedidos. |
| CATEGORIA | 1:N | PRODUCTO | Una categoría clasifica muchos productos; cada producto pertenece a una categoría. |
| PRODUCTO | 1:1 | INVENTARIO | Cada producto tiene un único registro de inventario. |
| PRODUCTO | 1:N | MOVIMIENTO_INVENTARIO | Un producto acumula movimientos a lo largo del tiempo. |
| PRODUCTO | 1:N | ITEM_CARRITO | Un producto puede aparecer en varios carritos. |
| CARRITO | 1:N | ITEM_CARRITO | Un carrito contiene sus líneas de productos. |
| PRODUCTO | 1:N | ITEM_PEDIDO | Un producto puede aparecer en muchos ítems de pedidos. |
| PEDIDO | 1:N | ITEM_PEDIDO | Un pedido contiene uno o varios ítems. |
| PEDIDO | 1:N | PAGO | Un pedido tiene al menos una transacción según la regla RN-28. |
| PEDIDO | 1:N | MOVIMIENTO_INVENTARIO | Un pedido confirmado genera movimientos de VENTA para sus productos. |
| FRANJA_HORARIA | 1:N | PEDIDO | Una franja puede ser usada por varios pedidos, respetando el cupo. |
| PEDIDO | 1:1 | DIRECCION_ENTREGA | Cada pedido conserva su propia dirección. |
| ZONA | 1:N | DIRECCION_ENTREGA | Una zona puede corresponder a varias direcciones. |
| PRODUCTO | N:M | OCASION | Se resuelve mediante PRODUCTO_OCASION. |
| PRODUCTO | N:M | PROMOCION | Se resuelve mediante PRODUCTO_PROMOCION. |
| USUARIO (rol Repartidor) | 0..N | PEDIDO | Un repartidor puede tener cero o varios pedidos asignados; cada pedido puede tener cero o un repartidor. La asignación está restringida a usuarios con rol Repartidor. |

## 6. Relaciones N:M y claves compuestas

Las relaciones muchos a muchos del catálogo se resuelven mediante entidades asociativas. La clave primaria compuesta evita duplicar la misma asociación.

| Entidad asociativa | Clave primaria | Claves foráneas | Relación |
| --- | --- | --- | --- |
| USUARIO_ROL | id_usuario + id_rol | id_usuario → USUARIO; id_rol → ROL | USUARIO N:M ROL |
| PRODUCTO_OCASION | id_producto + id_ocasion | id_producto → PRODUCTO; id_ocasion → OCASION | PRODUCTO N:M OCASION |
| PRODUCTO_PROMOCION | id_producto + id_promocion | id_producto → PRODUCTO; id_promocion → PROMOCION | PRODUCTO N:M PROMOCION |

## 7. Esquema global de conexiones

La siguiente representación resume las conexiones principales del modelo. Las entidades con relaciones N:M aparecen mediante sus tablas asociativas.

```text
USUARIO
  ├── 1:N ── USUARIO_ROL ── N:1 ── ROL
  ├── 1:N ── RECUPERACION_CONTRASEÑA
  ├── 0..1 ── CARRITO ── 1:N ── ITEM_CARRITO ── N:1 ── PRODUCTO
  ├── 1:N ── MOVIMIENTO_INVENTARIO ── N:1 ── PRODUCTO
  └── 1:N ── PEDIDO
                  ├── N:1 ── USUARIO (Repartidor, opcional)
                  ├── 1:N ── ITEM_PEDIDO ── N:1 ── PRODUCTO
                  ├── 1:N ── PAGO
                  ├── 1:N ── MOVIMIENTO_INVENTARIO
                  ├── 1:1 ── DIRECCION_ENTREGA ── N:1 ── ZONA
                  └── N:1 ── FRANJA_HORARIA

CATEGORIA ── 1:N ── PRODUCTO ── 1:1 ── INVENTARIO
                         │
                         ├── N:M ── OCASION
                         │          (PRODUCTO_OCASION)
                         │
                         └── N:M ── PROMOCION
                                    (PRODUCTO_PROMOCION)
```

## 8. Reglas de integridad y negocio consolidadas

1. El correo de USUARIO debe ser único.
2. La contraseña no se almacena en texto plano; se conserva como hash adaptativo con sal.
3. Tras cinco intentos fallidos se contempla bloqueo temporal de la cuenta, de acuerdo con el componente de seguridad.
4. Cada usuario puede tener uno o varios roles mediante USUARIO_ROL.
5. Cada usuario puede tener cero o un CARRITO; como máximo uno. id_usuario en CARRITO debe ser UNIQUE.
6. Un producto no puede repetirse dentro del mismo carrito; la combinación (id_carrito, id_producto) debe ser UNIQUE.
7. La cantidad de ITEM_CARRITO debe ser entera y mayor o igual a 1, y no debe superar el stock disponible al agregar o modificar.
8. Agregar al carrito no reserva ni descuenta stock.
9. El stock nunca puede ser negativo y se modifica mediante MOVIMIENTO_INVENTARIO.
10. INVENTARIO debe existir una sola vez por producto.
11. Los movimientos de inventario se conservan aunque el producto sea desactivado.
12. Los movimientos ENTRADA y MERMA no se originan en un pedido; VENTA sí debe vincularse a PEDIDO.
13. Una MERMA exige motivo y fecha; la cantidad del movimiento siempre es positiva.
14. Solo productos ACTIVO se muestran en el catálogo público.
15. El precio del producto debe ser mayor que cero.
16. Los nombres de CATEGORIA y OCASION deben ser únicos después de su normalización.
17. Una PROMOCION debe tener porcentaje válido y fecha_fin igual o posterior a fecha_inicio.
18. Un producto no debe tener dos promociones activas con periodos superpuestos; esto requiere validación de servicio, procedimiento o disparador.
19. Un PEDIDO conserva comprador y destinatario independientemente.
20. Cada PEDIDO conserva una única DIRECCION_ENTREGA y esta debe pertenecer a una ZONA con cobertura.
21. Cada PEDIDO debe tener al menos una transacción PAGO.
22. El pedido debe asociarse a una FRANJA_HORARIA válida y respetar el cupo correspondiente.
23. Un PEDIDO puede tener cero o un repartidor asignado; si existe id_repartidor, el usuario debe tener el rol Repartidor.
24. fecha_hora_entrega_real debe permanecer NULL hasta que el pedido pase a estado "Entregado"; al marcarlo como entregado se registra la fecha y hora efectiva.
25. El precio_unitario de ITEM_PEDIDO representa el precio vigente al confirmar y sirve para conservar el valor histórico.
26. El total y subtotales pueden calcularse a partir de sus componentes; si se persisten, deben tratarse como valores históricos y mantenerse consistentes.

## 9. Integridad referencial y comportamiento ante eliminación

| Relación | Comportamiento | Motivo |
| --- | --- | --- |
| INVENTARIO → PRODUCTO | RESTRINGIR | El producto se desactiva; no debe eliminarse si tiene historial. |
| MOVIMIENTO_INVENTARIO → PRODUCTO | RESTRINGIR | El historial de inventario debe conservarse. |
| MOVIMIENTO_INVENTARIO → USUARIO | RESTRINGIR | Se conserva la trazabilidad del usuario que registró el movimiento. |
| MOVIMIENTO_INVENTARIO → PEDIDO | RESTRINGIR | Los pedidos con movimientos de venta forman parte del historial. |
| ITEM_CARRITO → CARRITO | ELIMINAR EN CASCADA | El ítem no tiene existencia propia fuera del carrito. |
| CARRITO → USUARIO | ELIMINAR/REVISAR SEGÚN POLÍTICA | Es estado temporal, no historial. |
| ITEM_CARRITO → PRODUCTO | RESTRINGIR | El producto debe desactivarse en vez de borrarse. |
| ITEM_PEDIDO → PEDIDO | RESTRINGIR | El pedido confirmado es historial de la compra. |
| PAGO → PEDIDO | RESTRINGIR | Las transacciones deben conservarse como historial. |
| DIRECCION_ENTREGA → PEDIDO | RESTRINGIR | La dirección forma parte de la información histórica de entrega. |

## 10. Normalización

| Forma normal | Aplicación al modelo integrado | Resultado |
| --- | --- | --- |
| 1FN | Los atributos son atómicos. Las ocasiones, promociones y roles no se almacenan como listas dentro de PRODUCTO o USUARIO; se utilizan entidades asociativas. | Cumple |
| 2FN | Las tablas asociativas utilizan claves completas y no contienen atributos que dependan solo de una parte de la clave compuesta. | Cumple |
| 3FN | Los datos propios de CATEGORIA, OCASION, PROMOCION, ROL y ZONA están separados. PRODUCTO referencia CATEGORIA mediante FK y no repite sus datos. | Cumple |

## 11. Decisiones que quedan para el modelo físico

- Definir tipos de datos físicos definitivos, longitudes, índices y restricciones CHECK/UNIQUE según el motor de base de datos.
- Definir las opciones cerradas para estado de USUARIO, PRODUCTO, CATEGORIA, OCASION, PROMOCION, PEDIDO y PAGO.
- Definir el mecanismo físico para evitar promociones activas superpuestas por producto.
- Definir cómo se controlará el cupo de FRANJA_HORARIA por fecha concreta y las excepciones de alta demanda. La documentación fuente reconoce este punto como pendiente.
- Definir si PEDIDO.total se persiste como valor histórico o se calcula; si se persiste, establecer la regla de consistencia.
- Definir si ITEM_PEDIDO.subtotal se persiste o se calcula. La integración propuesta lo considera derivado.
- Implementar en una transacción la confirmación del pedido, la creación de movimientos de VENTA y el descuento del stock.
- Implementar la validación que impide agregar/modificar ITEM_CARRITO por encima del stock disponible.

## 12. Trazabilidad de los aportes

| Aporte | Entidades integradas | Área |
| --- | --- | --- |
| Iván | USUARIO, ROL, USUARIO_ROL, RECUPERACION_CONTRASEÑA, DIRECCION_ENTREGA y relación con ZONA. | Seguridad, cuentas, roles y dirección de entrega. |
| Juan | CATEGORIA, PRODUCTO, OCASION, PROMOCION, PRODUCTO_OCASION y PRODUCTO_PROMOCION. | Catálogo, clasificación, ocasiones y promociones. |
| Román | INVENTARIO, MOVIMIENTO_INVENTARIO, CARRITO e ITEM_CARRITO. | Stock, movimientos, carrito y sus líneas. |
| Steven | PEDIDO, ITEM_PEDIDO, PAGO, ZONA y FRANJA_HORARIA. | Pedidos, pagos, cobertura y franjas de entrega. |

## 13. Observaciones de integración

El principal conflicto entre los aportes es la ubicación del stock. Juan documenta stock_actual y umbral_stock_minimo dentro de PRODUCTO, mientras que Román desarrolla INVENTARIO como entidad independiente. La versión consolidada opta por INVENTARIO para evitar dos fuentes de verdad. Esta decisión debe mantenerse también en el modelo físico y en el código para impedir inconsistencias.

También se identificó que DIRECCION_ENTREGA y ZONA aparecen en más de un componente. Se conserva una única definición de cada entidad y se conectan con PEDIDO mediante una relación 1:1 y con ZONA mediante 1:N, respectivamente.

El modelo integrado no agrega entidades funcionales que no estén respaldadas por los documentos fuente. En particular, las excepciones de cupo por fecha de alta demanda quedan como una decisión pendiente para el modelo lógico/físico.

El modelo conserva PAGO porque representa el alcance general del sistema; las historias de método de pago y transacción que lo soportan corresponden a funcionalidades de prioridad Media y no forman parte del MVP definido en la Fase 1.

## 14. Conclusión

Con la consolidación se obtiene un modelo de 20 entidades que cubre cuentas y seguridad, catálogo, inventario, carrito, pedidos, pagos y entrega. Se definieron las PK de todas las entidades, las FK necesarias para conectar los módulos, las claves compuestas de las entidades asociativas y las cardinalidades principales. Las duplicidades de stock y las conexiones que estaban pendientes fueron resueltas de forma explícita, dejando documentadas las decisiones que todavía deben trasladarse al modelo físico.

## 15. Documentos base utilizados

- Documentación del componente de inventario y carrito — Fase 4 — Román Alberto Bolaños Cerquera.
- Aporte de Juan — Catálogo — Fase 4 — Juan Felipe.
- Fase 4 — Modelo conceptual de base de datos — Pedidos, Ítems, Pagos, Zonas y Franjas Horarias — Jorge Steven Gutierrez Fierro.
- Fase 4 — Modelo conceptual de base de datos — Componente de Iván.
