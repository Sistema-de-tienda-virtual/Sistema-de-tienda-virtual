**# Diccionario de datos — Sistema de tienda virtual**



**## 1. Información general**



\| Propiedad               | Descripción                                |

\| ----------------------- | ------------------------------------------ |

\| Proyecto                | Sistema de tienda virtual para floristería |

\| Fase                    | Fase 4 — Base de datos                     |

\| Motor                   | MySQL 8.0.16 o superior                    |

\| Base de datos           | \`floristeria_db\`                           |

\| Motor de almacenamiento | InnoDB                                     |

\| Juego de caracteres     | \`utf8mb4\`                                  |

\| Total de tablas         | 20                                         |



**## 2. Convenciones**



\* **\*\*PK:\*\*** clave primaria.

\* **\*\*FK:\*\*** clave foránea.

\* **\*\*AI:\*\*** incremento automático (\`AUTO_INCREMENT\`).

\* **\*\*UNIQUE:\*\*** restricción de unicidad.

\* **\*\*CHECK:\*\*** restricción que valida una condición.

\* **\*\*ENUM:\*\*** conjunto de valores permitidos.

\* **\*\*NULL:\*\*** campo que puede almacenar un valor nulo.

\* **\*\*NOT NULL:\*\*** campo obligatorio.

\* **\*\*CASCADE:\*\*** propaga la operación referencial.

\* **\*\*RESTRICT:\*\*** impide la operación cuando existen referencias.

\* **\*\*SET NULL:\*\*** establece la referencia en \`NULL\` cuando se elimina el registro relacionado.



Los tipos y restricciones descritos corresponden al DDL recibido. Las acciones referenciales se especifican en las relaciones de cada tabla.



**## 3. Diccionario de tablas**



**### 3.1. \`rol\`**



**\*\*Descripción:\*\*** catálogo de roles disponibles para asignar permisos a los usuarios.



\| Campo         | Tipo             | Restricciones           | Descripción                      |

\| ------------- | ---------------- | ----------------------- | -------------------------------- |

\| \`id_rol\`      | TINYINT UNSIGNED | PK, AI, NOT NULL        | Identificador del rol.           |

\| \`nombre\`      | VARCHAR(30)      | NOT NULL, UNIQUE, CHECK | Nombre único y no vacío del rol. |

\| \`descripcion\` | VARCHAR(150)     | NULL                    | Descripción del rol.             |



**### 3.2. \`usuario\`**



**\*\*Descripción:\*\*** almacena las cuentas de usuarios del sistema.



\| Campo               | Tipo                                     | Restricciones              | Descripción                                                                 |

\| ------------------- | ---------------------------------------- | -------------------------- | --------------------------------------------------------------------------- |

\| \`id_usuario\`        | BIGINT UNSIGNED                          | PK, AI, NOT NULL           | Identificador del usuario.                                                  |

\| \`nombre\`            | VARCHAR(120)                             | NOT NULL, CHECK            | Nombre del usuario; no puede estar vacío.                                   |

\| \`correo\`            | VARCHAR(180)                             | NOT NULL, UNIQUE, CHECK    | Correo único con validación básica de formato.                              |

\| \`contrasena_hash\`   | VARCHAR(255)                             | NOT NULL                   | Hash de la contraseña, con juego de caracteres ASCII y comparación binaria. |

\| \`estado\`            | ENUM('ACTIVO','DESACTIVADO','BLOQUEADO') | NOT NULL, DEFAULT 'ACTIVO' | Estado de la cuenta.                                                        |

\| \`intentos_fallidos\` | TINYINT UNSIGNED                         | NOT NULL, DEFAULT 0        | Cantidad de intentos fallidos consecutivos.                                 |

\| \`bloqueado_hasta\`   | DATETIME                                 | NULL                       | Fecha y hora hasta las que se mantiene el bloqueo temporal.                 |



**\*\*Restricciones e índices:\*\*** \`uq_usuario_correo\`, \`ck_usuario_nombre_no_vacio\`, \`ck_usuario_correo_formato\` y \`ck_usuario_bloqueo\`.



**### 3.3. \`usuario_rol\`**



**\*\*Descripción:\*\*** relaciona usuarios y roles mediante una relación muchos a muchos.



\| Campo        | Tipo             | Restricciones              | Descripción                      |

\| ------------ | ---------------- | -------------------------- | -------------------------------- |

\| \`id_usuario\` | BIGINT UNSIGNED  | PK compuesta, FK, NOT NULL | Usuario al que se asigna el rol. |

\| \`id_rol\`     | TINYINT UNSIGNED | PK compuesta, FK, NOT NULL | Rol asignado al usuario.         |



**\*\*Clave primaria compuesta:\*\*** (\`id_usuario\`, \`id_rol\`).



**\*\*Relaciones:\*\***



\* \`id_usuario\` referencia \`usuario(id_usuario)\`: \`ON DELETE CASCADE ON UPDATE CASCADE\`.

\* \`id_rol\` referencia \`rol(id_rol)\`: \`ON DELETE RESTRICT ON UPDATE CASCADE\`.



Índice adicional: \`ix_usuario_rol_rol\`.



**### 3.4. \`recuperacion_contrasena\`**



**\*\*Descripción:\*\*** registra las solicitudes de recuperación de contraseña.



\| Campo              | Tipo            | Restricciones                       | Descripción                           |

\| ------------------ | --------------- | ----------------------------------- | ------------------------------------- |

\| \`id_recuperacion\`  | BIGINT UNSIGNED | PK, AI, NOT NULL                    | Identificador de la solicitud.        |

\| \`id_usuario\`       | BIGINT UNSIGNED | FK, NOT NULL                        | Usuario que solicita la recuperación. |

\| \`token\`            | CHAR(64)        | NOT NULL, UNIQUE                    | Hash del token de recuperación.       |

\| \`fecha_generacion\` | DATETIME        | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Fecha y hora de generación.           |

\| \`fecha_expiracion\` | DATETIME        | NOT NULL, CHECK                     | Fecha y hora de expiración.           |

\| \`utilizado\`        | BOOLEAN         | NOT NULL, DEFAULT FALSE             | Indica si el token ya fue utilizado.  |



**\*\*Relaciones:\*\*** \`id_usuario\` referencia \`usuario(id_usuario)\`, con \`ON DELETE CASCADE ON UPDATE CASCADE\`.



**\*\*Restricciones e índices:\*\*** \`uq_recuperacion_token\`, \`ck_recuperacion_vigencia\` e \`ix_recuperacion_usuario_vigencia\`.



**### 3.5. \`categoria\`**



**\*\*Descripción:\*\*** clasifica los productos de la floristería.



\| Campo          | Tipo                      | Restricciones              | Descripción                    |

\| -------------- | ------------------------- | -------------------------- | ------------------------------ |

\| \`id_categoria\` | SMALLINT UNSIGNED         | PK, AI, NOT NULL           | Identificador de la categoría. |

\| \`nombre\`       | VARCHAR(60)               | NOT NULL, UNIQUE, CHECK    | Nombre único y no vacío.       |

\| \`estado\`       | ENUM('ACTIVA','INACTIVA') | NOT NULL, DEFAULT 'ACTIVA' | Estado de la categoría.        |



Restricciones: \`uq_categoria_nombre\` y \`ck_categoria_nombre_no_vacio\`.



**### 3.6. \`producto\`**



**\*\*Descripción:\*\*** almacena la información comercial de los productos. El inventario se gestiona por separado.



\| Campo                     | Tipo                      | Restricciones              | Descripción                                |

\| ------------------------- | ------------------------- | -------------------------- | ------------------------------------------ |

\| \`id_producto\`             | BIGINT UNSIGNED           | PK, AI, NOT NULL           | Identificador del producto.                |

\| \`id_categoria\`            | SMALLINT UNSIGNED         | FK, NOT NULL               | Categoría a la que pertenece.              |

\| \`nombre\`                  | VARCHAR(150)              | NOT NULL, CHECK            | Nombre del producto.                       |

\| \`descripcion\`             | VARCHAR(1000)             | NOT NULL                   | Descripción del producto.                  |

\| \`precio\`                  | DECIMAL(12,2)             | NOT NULL, CHECK            | Precio comercial del producto.             |

\| \`fecha_ingreso\`           | DATE                      | NOT NULL                   | Fecha de ingreso del producto al catálogo. |

\| \`vida_util_estimada_dias\` | SMALLINT UNSIGNED         | NULL, CHECK                | Vida útil estimada en días.                |

\| \`estado\`                  | ENUM('ACTIVO','INACTIVO') | NOT NULL, DEFAULT 'ACTIVO' | Estado del producto.                       |



**\*\*Relación:\*\*** \`id_categoria\` referencia \`categoria(id_categoria)\`, con \`ON DELETE RESTRICT ON UPDATE CASCADE\`.



**\*\*Restricciones:\*\*** precio mayor que cero, vida útil positiva cuando se especifica y nombre no vacío.



**\*\*Índices:\*\*** \`ix_producto_estado_categoria\`, \`ix_producto_nombre\` e \`ix_producto_estado_precio\`.






**### 3.7. \`ocasion\`**



**\*\*Descripción:\*\*** catálogo de ocasiones para clasificar productos.



\| Campo        | Tipo                      | Restricciones              | Descripción                            |

\| ------------ | ------------------------- | -------------------------- | -------------------------------------- |

\| \`id_ocasion\` | SMALLINT UNSIGNED         | PK, AI, NOT NULL           | Identificador de la ocasión.           |

\| \`nombre\`     | VARCHAR(60)               | NOT NULL, UNIQUE, CHECK    | Nombre único y no vacío de la ocasión. |

\| \`estado\`     | ENUM('ACTIVA','INACTIVA') | NOT NULL, DEFAULT 'ACTIVA' | Estado de la ocasión.                  |



**### 3.8. \`promocion\`**



**\*\*Descripción:\*\*** almacena las promociones y sus periodos de vigencia.



\| Campo                  | Tipo                                   | Restricciones              | Descripción                                          |

\| ---------------------- | -------------------------------------- | -------------------------- | ---------------------------------------------------- |

\| \`id_promocion\`         | BIGINT UNSIGNED                        | PK, AI, NOT NULL           | Identificador de la promoción.                       |

\| \`descripcion\`           | VARCHAR(255)                           | NOT NULL                   | Descripción de la promoción.                         |

\| \`porcentaje_descuento\` | DECIMAL(5,2)                           | NOT NULL, CHECK            | Porcentaje de descuento, mayor que cero y hasta 100. |

\| \`fecha_inicio\`         | DATE                                   | NOT NULL                   | Fecha inicial de vigencia.                           |

\| \`fecha_fin\`            | DATE                                   | NOT NULL, CHECK            | Fecha final, igual o posterior a la inicial.         |

\| \`estado\`               | ENUM('ACTIVA','INACTIVA','FINALIZADA') | NOT NULL, DEFAULT 'ACTIVA' | Estado de la promoción.                              |



**\*\*Importante:\*\*** el nombre físico \`descripcion\` conserva la escritura exacta del DDL recibido. No lo cambies sin actualizar también los scripts y el modelo físico.



Índice: \`ix_promocion_vigencia\`.



**### 3.9. \`producto_ocasion\`**



**\*\*Descripción:\*\*** tabla intermedia que relaciona productos con ocasiones.



\| Campo         | Tipo              | Restricciones              | Descripción           |

\| ------------- | ----------------- | -------------------------- | --------------------- |

\| \`id_producto\` | BIGINT UNSIGNED   | PK compuesta, FK, NOT NULL | Producto relacionado. |

\| \`id_ocasion\`  | SMALLINT UNSIGNED | PK compuesta, FK, NOT NULL | Ocasión relacionada.  |



**\*\*Clave primaria compuesta:\*\*** (\`id_producto\`, \`id_ocasion\`).



**\*\*Relaciones:\*\***



\* Producto: \`ON DELETE CASCADE ON UPDATE CASCADE\`.

\* Ocasión: \`ON DELETE RESTRICT ON UPDATE CASCADE\`.



Índice: \`ix_producto_ocasion_ocasion\`.



**### 3.10. \`producto_promocion\`**



**\*\*Descripción:\*\*** relaciona los productos con las promociones aplicables.



\| Campo          | Tipo            | Restricciones              | Descripción            |

\| -------------- | --------------- | -------------------------- | ---------------------- |

\| \`id_producto\`  | BIGINT UNSIGNED | PK compuesta, FK, NOT NULL | Producto relacionado.  |

\| \`id_promocion\` | BIGINT UNSIGNED | PK compuesta, FK, NOT NULL | Promoción relacionada. |



**\*\*Clave primaria compuesta:\*\*** (\`id_producto\`, \`id_promocion\`).



**\*\*Relaciones:\*\*** ambas claves foráneas utilizan \`ON DELETE CASCADE ON UPDATE CASCADE\`.



Índice: \`ix_producto_promocion_promocion\`.



La regla de una sola promoción activa por producto requiere lógica adicional porque depende de la coincidencia de fechas.



**### 3.11. \`zona\`**



**\*\*Descripción:\*\*** registra las zonas de cobertura para las entregas.



\| Campo     | Tipo                      | Restricciones              | Descripción               |

\| --------- | ------------------------- | -------------------------- | ------------------------- |

\| \`id_zona\` | SMALLINT UNSIGNED         | PK, AI, NOT NULL           | Identificador de la zona. |

\| \`nombre\`  | VARCHAR(80)               | NOT NULL, UNIQUE, CHECK    | Nombre único y no vacío.  |

\| \`estado\`  | ENUM('ACTIVA','INACTIVA') | NOT NULL, DEFAULT 'ACTIVA' | Estado de la zona.        |



**### 3.12. \`franja_horaria\`**



**\*\*Descripción:\*\*** define intervalos horarios reutilizables para las entregas.



\| Campo               | Tipo                      | Restricciones                     | Descripción                                  |

\| ------------------- | ------------------------- | --------------------------------- | -------------------------------------------- |

\| \`id_franja_horaria\` | SMALLINT UNSIGNED         | PK, AI, NOT NULL                  | Identificador de la franja.                  |

\| \`hora_inicio\`       | TIME                      | NOT NULL, UNIQUE compuesta        | Hora de inicio.                              |

\| \`hora_fin\`          | TIME                      | NOT NULL, UNIQUE compuesta, CHECK | Hora de finalización posterior a la inicial. |

\| \`cupo_maximo\`       | SMALLINT UNSIGNED         | NOT NULL, CHECK                   | Capacidad máxima de entregas.                |

\| \`estado\`            | ENUM('ACTIVA','INACTIVA') | NOT NULL, DEFAULT 'ACTIVA'        | Estado de la franja.                         |



**\*\*Restricciones:\*\*** \`uq_franja_horas\`, \`ck_franja_horas\` y \`ck_franja_cupo_maximo\`.



**### 3.13. \`pedido\`**



**\*\*Descripción:\*\*** registra los pedidos, sus responsables, fecha de entrega y valor histórico.



\| Campo                     | Tipo                                                                    | Restricciones                       | Descripción                          |

\| ------------------------- | ----------------------------------------------------------------------- | ----------------------------------- | ------------------------------------ |

\| \`id_pedido\`               | BIGINT UNSIGNED                                                         | PK, AI, NOT NULL                    | Identificador del pedido.            |

\| \`id_usuario\`              | BIGINT UNSIGNED                                                         | FK, NOT NULL                        | Usuario comprador.                   |

\| \`id_repartidor\`           | BIGINT UNSIGNED                                                         | FK, NULL                            | Usuario asignado como repartidor.    |

\| \`id_franja_horaria\`       | SMALLINT UNSIGNED                                                       | FK, NOT NULL                        | Franja horaria solicitada.           |

\| \`nombre_comprador\`        | VARCHAR(120)                                                            | NOT NULL, CHECK                     | Nombre del comprador.                |

\| \`nombre_destinatario\`     | VARCHAR(120)                                                            | NOT NULL, CHECK                     | Nombre del destinatario.             |

\| \`fecha_entrega\`           | DATE                                                                    | NOT NULL                            | Fecha solicitada para la entrega.    |

\| \`dedicatoria\`             | VARCHAR(200)                                                            | NULL                                | Mensaje que acompaña el pedido.      |

\| \`estado\`                  | ENUM('CONFIRMADO','EN_PREPARACION','EN_CAMINO','ENTREGADO','CANCELADO') | NOT NULL, DEFAULT 'CONFIRMADO'      | Estado del pedido.                   |

\| \`total\`                   | DECIMAL(12,2)                                                           | NOT NULL, CHECK                     | Valor total histórico del pedido.    |

\| \`fecha_hora_entrega_real\` | DATETIME                                                                | NULL                                | Fecha y hora real de entrega.        |

\| \`fecha_creacion\`          | DATETIME                                                                | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Fecha y hora de creación del pedido. |



**\*\*Relaciones:\*\***



\* \`id_usuario\` referencia \`usuario(id_usuario)\`: \`ON DELETE RESTRICT ON UPDATE CASCADE\`.

\* \`id_repartidor\` referencia \`usuario(id_usuario)\`: \`ON DELETE SET NULL ON UPDATE CASCADE\`.

\* \`id_franja_horaria\` referencia \`franja_horaria(id_franja_horaria)\`: \`ON DELETE RESTRICT ON UPDATE CASCADE\`.



**\*\*Restricciones:\*\*** total no negativo, nombres de comprador y destinatario no vacíos y coherencia entre el estado \`ENTREGADO\` y la fecha real de entrega.



**\*\*Índices:\*\*** \`ix_pedido_estado_fecha\`, \`ix_pedido_usuario\`, \`ix_pedido_repartidor\` e \`ix_pedido_franja_fecha\`.



**### 3.14. \`direccion_entrega\`**



**\*\*Descripción:\*\*** almacena la dirección asociada a cada pedido.



\| Campo                  | Tipo              | Restricciones        | Descripción                                     |

\| ---------------------- | ----------------- | -------------------- | ----------------------------------------------- |

\| \`id_direccion_entrega\` | BIGINT UNSIGNED   | PK, AI, NOT NULL     | Identificador de la dirección.                  |

\| \`id_pedido\`            | BIGINT UNSIGNED   | FK, NOT NULL, UNIQUE | Pedido asociado; solo una dirección por pedido. |

\| \`id_zona\`              | SMALLINT UNSIGNED | FK, NOT NULL         | Zona de entrega.                                |

\| \`direccion\`            | VARCHAR(200)      | NOT NULL, CHECK      | Dirección física.                               |

\| \`barrio\`               | VARCHAR(100)      | NOT NULL             | Barrio de entrega.                              |

\| \`ciudad\`               | VARCHAR(100)      | NOT NULL             | Ciudad de entrega.                              |

\| \`referencia\`           | VARCHAR(255)      | NULL                 | Referencia adicional para localizar el lugar.   |



**\*\*Relaciones:\*\*** las claves foráneas de pedido y zona utilizan \`ON DELETE RESTRICT ON UPDATE CASCADE\`.



Índice: \`ix_direccion_zona\`.



**### 3.15. \`item_pedido\`**



**\*\*Descripción:\*\*** almacena los productos incluidos en cada pedido y el precio unitario histórico.



\| Campo             | Tipo            | Restricciones    | Descripción                                        |

\| ----------------- | --------------- | ---------------- | -------------------------------------------------- |

\| \`id_item_pedido\`  | BIGINT UNSIGNED | PK, AI, NOT NULL | Identificador del detalle.                         |

\| \`id_pedido\`       | BIGINT UNSIGNED | FK, NOT NULL     | Pedido al que pertenece.                           |

\| \`id_producto\`     | BIGINT UNSIGNED | FK, NOT NULL     | Producto incluido.                                 |

\| \`cantidad\`        | INT             | NOT NULL, CHECK  | Cantidad solicitada; mínimo una unidad.            |

\| \`precio_unitario\` | DECIMAL(12,2)   | NOT NULL, CHECK  | Precio unitario conservado al confirmar el pedido. |



**\*\*Restricción:\*\*** \`UNIQUE(id_pedido, id_producto)\` impide repetir un producto en el mismo pedido.



**\*\*Relaciones:\*\*** ambas claves foráneas utilizan \`ON DELETE RESTRICT ON UPDATE CASCADE\`.



Índice: \`ix_item_pedido_producto\`.



El subtotal se calcula mediante \`cantidad \* precio_unitario\`; no se almacena como campo independiente.



**### 3.16. \`pago\`**



**\*\*Descripción:\*\*** registra las transacciones asociadas a los pedidos.



\| Campo        | Tipo                                            | Restricciones                       | Descripción                       |

\| ------------ | ----------------------------------------------- | ----------------------------------- | --------------------------------- |

\| \`id_pago\`    | BIGINT UNSIGNED                                 | PK, AI, NOT NULL                    | Identificador del pago.           |

\| \`id_pedido\`  | BIGINT UNSIGNED                                 | FK, NOT NULL                        | Pedido asociado al pago.          |

\| \`monto\`      | DECIMAL(12,2)                                   | NOT NULL, CHECK                     | Importe del pago, mayor que cero. |

\| \`metodo\`     | ENUM('TARJETA','TRANSFERENCIA','CONTRAENTREGA') | NOT NULL                            | Método de pago.                   |

\| \`fecha_hora\` | DATETIME                                        | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Fecha y hora del pago.            |

\| \`estado\`     | ENUM('APROBADO','RECHAZADO')                    | NOT NULL                            | Resultado del pago.               |



**\*\*Relación:\*\*** \`id_pedido\` referencia \`pedido(id_pedido)\`, con \`ON DELETE RESTRICT ON UPDATE CASCADE\`.



Índice: \`ix_pago_pedido\`.



**### 3.17. \`inventario\`**



**\*\*Descripción:\*\*** almacena el stock actual y el umbral mínimo de cada producto.



\| Campo                 | Tipo            | Restricciones              | Descripción                                               |

\| --------------------- | --------------- | -------------------------- | --------------------------------------------------------- |

\| \`id_producto\`         | BIGINT UNSIGNED | PK, FK, NOT NULL           | Producto asociado; identifica el inventario del producto. |

\| \`stock_actual\`        | INT             | NOT NULL, DEFAULT 0, CHECK | Cantidad disponible; no puede ser negativa.               |

\| \`umbral_stock_minimo\` | INT             | NULL, CHECK                | Umbral para alertas de existencias bajas.                 |



**\*\*Relación:\*\*** \`id_producto\` referencia \`producto(id_producto)\`, con \`ON DELETE RESTRICT ON UPDATE CASCADE\`.



La estructura establece una relación uno a uno entre producto e inventario.



**### 3.18. \`movimiento_inventario\`**



**\*\*Descripción:\*\*** registra entradas, ventas y mermas de inventario.



\| Campo           | Tipo                            | Restricciones                       | Descripción                                                   |

\| --------------- | ------------------------------- | ----------------------------------- | ------------------------------------------------------------- |

\| \`id_movimiento\` | BIGINT UNSIGNED                 | PK, AI, NOT NULL                    | Identificador del movimiento.                                 |

\| \`id_producto\`   | BIGINT UNSIGNED                 | FK, NOT NULL                        | Producto afectado.                                            |

\| \`id_usuario\`    | BIGINT UNSIGNED                 | FK, NOT NULL                        | Usuario que registra el movimiento.                           |

\| \`id_pedido\`     | BIGINT UNSIGNED                 | FK, NULL                            | Pedido relacionado cuando el movimiento es una venta.         |

\| \`tipo\`          | ENUM('ENTRADA','VENTA','MERMA') | NOT NULL                            | Tipo de movimiento.                                           |

\| \`cantidad\`      | INT                             | NOT NULL, CHECK                     | Cantidad positiva del movimiento.                             |

\| \`fecha\`         | DATETIME                        | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Fecha y hora del movimiento.                                  |

\| \`motivo\`        | VARCHAR(255)                    | NULL                                | Motivo del movimiento, obligatorio y no vacío para una merma. |



**\*\*Relaciones:\*\***



\* Producto: \`ON DELETE RESTRICT ON UPDATE CASCADE\`.

\* Usuario: \`ON DELETE RESTRICT ON UPDATE CASCADE\`.

\* Pedido: \`ON DELETE RESTRICT ON UPDATE RESTRICT\`.



**\*\*Restricciones:\*\*** \`ck_movimiento_cantidad\`, \`ck_movimiento_motivo_merma\` y \`ck_movimiento_pedido_venta\`.



Una venta debe tener un pedido asociado; una entrada o merma no debe tenerlo.



**\*\*Índices:\*\*** \`ix_movimiento_producto_fecha\`, \`ix_movimiento_tipo_fecha\`, \`ix_movimiento_usuario\` e \`ix_movimiento_pedido\`.



**### 3.19. \`carrito\`**



**\*\*Descripción:\*\*** almacena el carrito temporal asociado a un usuario.



\| Campo            | Tipo            | Restricciones                       | Descripción                                         |

\| ---------------- | --------------- | ----------------------------------- | --------------------------------------------------- |

\| \`id_carrito\`     | BIGINT UNSIGNED | PK, AI, NOT NULL                    | Identificador del carrito.                          |

\| \`id_usuario\`     | BIGINT UNSIGNED | FK, NOT NULL, UNIQUE                | Usuario propietario; máximo un carrito por usuario. |

\| \`fecha_creacion\` | DATETIME        | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Fecha y hora de creación.                           |



**\*\*Relación:\*\*** \`id_usuario\` referencia \`usuario(id_usuario)\`, con \`ON DELETE CASCADE ON UPDATE CASCADE\`.



**### 3.20. \`item_carrito\`**



**\*\*Descripción:\*\*** registra los productos y las cantidades agregadas al carrito.



\| Campo             | Tipo            | Restricciones    | Descripción                             |

\| ----------------- | --------------- | ---------------- | --------------------------------------- |

\| \`id_item_carrito\` | BIGINT UNSIGNED | PK, AI, NOT NULL | Identificador del elemento del carrito. |

\| \`id_carrito\`      | BIGINT UNSIGNED | FK, NOT NULL     | Carrito al que pertenece.               |

\| \`id_producto\`     | BIGINT UNSIGNED | FK, NOT NULL     | Producto agregado.                      |

\| \`cantidad\`        | INT             | NOT NULL, CHECK  | Cantidad solicitada; mínimo una unidad. |



**\*\*Restricción:\*\*** \`UNIQUE(id_carrito, id_producto)\` impide registrar dos filas para el mismo producto en un carrito.



**\*\*Relaciones:\*\***



\* Carrito: \`ON DELETE CASCADE ON UPDATE CASCADE\`.

\* Producto: \`ON DELETE RESTRICT ON UPDATE CASCADE\`.



Índice: \`ix_item_carrito_producto\`.



El precio no se almacena en esta tabla; se toma el precio vigente al confirmar el pedido.



**## 4. Resumen de relaciones**



\| Tabla de origen           | Campo FK            | Tabla referenciada | Relación               |

\| ------------------------- | ------------------- | ------------------ | ---------------------- |

\| \`usuario_rol\`             | \`id_usuario\`        | \`usuario\`          | Muchos a uno           |

\| \`usuario_rol\`             | \`id_rol\`            | \`rol\`              | Muchos a uno           |

\| \`recuperacion_contrasena\` | \`id_usuario\`        | \`usuario\`          | Muchos a uno           |

\| \`producto\`                | \`id_categoria\`      | \`categoria\`        | Muchos a uno           |

\| \`producto_ocasion\`        | \`id_producto\`       | \`producto\`         | Muchos a uno           |

\| \`producto_ocasion\`        | \`id_ocasion\`        | \`ocasion\`          | Muchos a uno           |

\| \`producto_promocion\`      | \`id_producto\`       | \`producto\`         | Muchos a uno           |

\| \`producto_promocion\`      | \`id_promocion\`      | \`promocion\`        | Muchos a uno           |

\| \`pedido\`                  | \`id_usuario\`        | \`usuario\`          | Muchos a uno           |

\| \`pedido\`                  | \`id_repartidor\`     | \`usuario\`          | Muchos a uno, opcional |

\| \`pedido\`                  | \`id_franja_horaria\` | \`franja_horaria\`   | Muchos a uno           |

\| \`direccion_entrega\`       | \`id_pedido\`         | \`pedido\`           | Uno a uno              |

\| \`direccion_entrega\`       | \`id_zona\`           | \`zona\`             | Muchos a uno           |

\| \`item_pedido\`             | \`id_pedido\`         | \`pedido\`           | Muchos a uno           |

\| \`item_pedido\`             | \`id_producto\`       | \`producto\`         | Muchos a uno           |

\| \`pago\`                    | \`id_pedido\`         | \`pedido\`           | Muchos a uno           |

\| \`inventario\`              | \`id_producto\`       | \`producto\`         | Uno a uno              |

\| \`movimiento_inventario\`   | \`id_producto\`       | \`producto\`         | Muchos a uno           |

\| \`movimiento_inventario\`   | \`id_usuario\`        | \`usuario\`          | Muchos a uno           |

\| \`movimiento_inventario\`   | \`id_pedido\`         | \`pedido\`           | Muchos a uno, opcional |

\| \`carrito\`                 | \`id_usuario\`        | \`usuario\`          | Uno a uno              |

\| \`item_carrito\`            | \`id_carrito\`        | \`carrito\`          | Muchos a uno           |

\| \`item_carrito\`            | \`id_producto\`       | \`producto\`         | Muchos a uno           |



**## 5. Reglas de integridad relevantes**



1\. Los identificadores principales se definen mediante claves primarias.

2\. Las relaciones entre tablas se implementan con claves foráneas.

3\. Los nombres, correos y asociaciones que requieren unicidad utilizan restricciones \`UNIQUE\`.

4\. Los precios, cantidades, porcentajes y fechas se validan mediante restricciones cuando están definidas en el DDL.

5\. Las contraseñas se almacenan como hashes, no como contraseñas en texto plano.

6\. Los detalles del pedido conservan el precio unitario histórico.

7\. El inventario y sus movimientos se modelan en tablas separadas.

8\. Las restricciones de eliminación y actualización protegen los registros históricos.

9\. Algunas reglas de negocio requieren lógica adicional de la aplicación, como la exclusividad de promociones activas y la validación de cupos de entrega.



**## 6. Fuente y mantenimiento**



Este documento se basa en \`scripts/01-crear-tablas.sql\` y debe mantenerse sincronizado con \`modelos/modelo-integrado.md\` y \`modelos/modelo-fisico.md\`.



Ante cualquier cambio en las tablas, campos, tipos de datos, relaciones, índices o restricciones, actualizar el diccionario y los modelos correspondientes.



**\*\*Observación de revisión:\*\*** antes de considerar definitiva la documentación, comprobar que la definición completa de \`producto\` en el script SQL esté íntegra y que todos los nombres físicos coincidan con el esquema real de MySQL.