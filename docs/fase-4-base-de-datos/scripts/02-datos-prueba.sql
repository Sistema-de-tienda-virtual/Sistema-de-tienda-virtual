-- ============================================================
-- FASE 4 - DATOS DE PRUEBA
-- Proyecto: Floristería Aroma de Rosas
-- Motor: MySQL 8.0.16+
-- Archivo: 02-datos-prueba.sql
-- ============================================================

USE floristeria_db;

START TRANSACTION;

-- 1. ROLES
INSERT INTO rol (id_rol, nombre, descripcion) VALUES
(1, 'ADMINISTRADOR', 'Gestion general del sistema'),
(2, 'CLIENTE', 'Compra productos de la floristeria'),
(3, 'REPARTIDOR', 'Entrega pedidos');

-- 2. USUARIOS
-- Los hashes son valores ficticios para pruebas de base de datos.
INSERT INTO usuario
(id_usuario, nombre, correo, contrasena_hash, estado,
 intentos_fallidos, bloqueado_hasta)
VALUES
(1, 'Administrador Prueba', 'admin@aromaderosas.com',
 'HASH_DE_PRUEBA_ADMIN', 'ACTIVO', 0, NULL),
(2, 'Cliente Prueba', 'cliente@aromaderosas.com',
 'HASH_DE_PRUEBA_CLIENTE', 'ACTIVO', 0, NULL),
(3, 'Repartidor Prueba', 'repartidor@aromaderosas.com',
 'HASH_DE_PRUEBA_REPARTIDOR', 'ACTIVO', 0, NULL);

-- 3. ASIGNACION DE ROLES
INSERT INTO usuario_rol (id_usuario, id_rol) VALUES
(1, 1),
(2, 2),
(3, 3);

-- 4. RECUPERACION DE CONTRASENA
-- Token ficticio de 64 caracteres hexadecimales para pruebas.
INSERT INTO recuperacion_contrasena (
    id_recuperacion,
    id_usuario,
    token,
    fecha_generacion,
    fecha_expiracion,
    utilizado
) VALUES (
    1,
    2,
    REPEAT('a', 64),
    CURRENT_TIMESTAMP,
    DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 30 MINUTE),
    FALSE
);

-- 5. CATEGORIAS
INSERT INTO categoria (id_categoria, nombre, estado) VALUES
(1, 'Rosas', 'ACTIVA'),
(2, 'Ramos', 'ACTIVA'),
(3, 'Plantas', 'ACTIVA');

-- 6. OCASIONES
INSERT INTO ocasion (id_ocasion, nombre, estado) VALUES
(1, 'Cumpleanos', 'ACTIVA'),
(2, 'Aniversario', 'ACTIVA'),
(3, 'Amor y amistad', 'ACTIVA');

-- 7. PROMOCIONES
INSERT INTO promocion (
    id_promocion,
    descipcion,
    porcentaje_descuento,
    fecha_inicio,
    fecha_fin,
    estado
)
 VALUES (
    1,
    'Descuento de bienvenida',
    10.00,
    CURRENT_DATE,
    DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY),
    'ACTIVA'
);
-- 8. ZONAS DE ENTREGA
INSERT INTO zona (id_zona, nombre, estado) VALUES
(1, 'Zona Norte', 'ACTIVA'),
(2, 'Zona Centro', 'ACTIVA'),
(3, 'Zona Sur', 'ACTIVA');

-- 9. FRANJAS HORARIAS
INSERT INTO franja_horaria
(id_franja_horaria, hora_inicio, hora_fin, cupo_maximo, estado)
VALUES
(1, '08:00:00', '10:00:00', 10, 'ACTIVA'),
(2, '10:00:00', '12:00:00', 10, 'ACTIVA'),
(3, '14:00:00', '16:00:00', 8, 'ACTIVA');

-- 10. PRODUCTOS
INSERT INTO producto
(id_producto, id_categoria, nombre, descripcion, precio,
 fecha_ingreso, vida_util_estimada_dias, estado)
VALUES
(1, 1, 'Rosa roja', 'Rosa roja individual', 8000.00,
 CURRENT_DATE, 7, 'ACTIVO'),
(2, 2, 'Ramo romantico', 'Ramo de rosas para regalar', 65000.00,
 CURRENT_DATE, 7, 'ACTIVO'),
(3, 3, 'Orquidea', 'Planta ornamental decorativa', 45000.00,
 CURRENT_DATE, 20, 'ACTIVO');

-- 11. PRODUCTOS POR OCASION
INSERT INTO producto_ocasion (id_producto, id_ocasion) VALUES
(1, 2),
(2, 1),
(2, 2),
(2, 3),
(3, 1);

-- 12. PRODUCTOS POR PROMOCION
INSERT INTO producto_promocion (id_producto, id_promocion) VALUES
(1, 1),
(2, 1);

-- 13. INVENTARIO
INSERT INTO inventario
(id_producto, stock_actual, umbral_stock_minimo)
VALUES
(1, 97, 10),
(2, 24, 5),
(3, 15, 3);


-- 14. CARRITOS
INSERT INTO carrito (id_carrito, id_usuario, fecha_creacion) VALUES
(1, 2, CURRENT_TIMESTAMP);

-- 15. ITEMS DEL CARRITO
INSERT INTO item_carrito
(id_item_carrito, id_carrito, id_producto, cantidad)
VALUES
(1, 1, 1, 3),
(2, 1, 2, 1);

-- 16. PEDIDOS
-- PEDIDO DE PRUEBA
INSERT INTO pedido (
    id_pedido,
    id_usuario,
    id_repartidor,
    id_franja_horaria,
    nombre_comprador,
    nombre_destinatario,
    fecha_entrega,
    dedicatoria,
    estado,
    total,
    fecha_hora_entrega_real,
    fecha_creacion
) VALUES (
    1,
    2,
    3,
    1,
    'Cliente Prueba',
    'Destinatario Prueba',
    DATE_ADD(CURRENT_DATE, INTERVAL 2 DAY),
    'Feliz dia, con mucho carino',
    'CONFIRMADO',
    89000.00,
    NULL,
    CURRENT_TIMESTAMP
);
-- 17. DIRECCIONES DE ENTREGA
-- DIRECCIÓN DE ENTREGA
INSERT INTO direccion_entrega (
    id_direccion_entrega,
    id_pedido,
    id_zona,
    direccion,
    barrio,
    ciudad,
    referencia
) VALUES (
    1,
    1,
    2,
    'Calle 10 # 5-20',
    'Centro',
    'Neiva',
    'Casa de prueba'
);
-- 18. ITEMS DEL PEDIDO
-- ARTÍCULOS DEL PEDIDO
INSERT INTO item_pedido (
    id_item_pedido,
    id_pedido,
    id_producto,
    cantidad,
    precio_unitario
) VALUES
(1, 1, 1, 3, 8000.00),
(2, 1, 2, 1, 65000.00);
-- 19. PAGOS
INSERT INTO pago (
    id_pago,
    id_pedido,
    monto,
    metodo,
    estado
) VALUES
(1, 1, 89000.00, 'TARJETA', 'APROBADO');
-- 20. MOVIMIENTOS DE INVENTARIO
INSERT INTO movimiento_inventario (
    id_movimiento,
    id_producto,
    id_usuario,
    id_pedido,
    tipo,
    cantidad,
    fecha,
    motivo
) VALUES
(1, 1, 1, NULL, 'ENTRADA', 100, CURRENT_TIMESTAMP, 'Carga inicial de prueba'),
(2, 2, 1, NULL, 'ENTRADA', 25, CURRENT_TIMESTAMP, 'Carga inicial de prueba'),
(3, 3, 1, NULL, 'ENTRADA', 15, CURRENT_TIMESTAMP, 'Carga inicial de prueba'),
(4, 1, 1, 1, 'VENTA', 3, CURRENT_TIMESTAMP, 'Venta del pedido de prueba'),
(5, 2, 1, 1, 'VENTA', 1, CURRENT_TIMESTAMP, 'Venta del pedido de prueba');

COMMIT;
-- ============================================================
-- FIN DE LOS DATOS DE PRUEBA
-- ============================================================
```