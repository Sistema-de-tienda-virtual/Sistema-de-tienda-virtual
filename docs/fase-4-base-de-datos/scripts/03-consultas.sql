
-- ============================================================
-- FASE 4: CONSULTAS DE VERIFICACION
-- Proyecto: Floristeria Aroma de Rosas
-- Base de datos: floristeria_db
-- Motor: MySQL
-- ============================================================

USE floristeria_db;

-- 1. Verificar las tablas existentes
SHOW TABLES;

-- 2. Contar los registros de las tablas principales
SELECT 'usuario' AS tabla, COUNT(*) AS total FROM usuario
UNION ALL
SELECT 'categoria', COUNT(*) FROM categoria
UNION ALL
SELECT 'producto', COUNT(*) FROM producto
UNION ALL
SELECT 'inventario', COUNT(*) FROM inventario
UNION ALL
SELECT 'pedido', COUNT(*) FROM pedido
UNION ALL
SELECT 'item_pedido', COUNT(*) FROM item_pedido
UNION ALL
SELECT 'pago', COUNT(*) FROM pago
UNION ALL
SELECT 'movimiento_inventario', COUNT(*) FROM movimiento_inventario;

-- 3. Verificar los pedidos y comparar sus totales con los detalles
SELECT
    p.id_pedido,
    p.estado,
    p.total AS total_pedido,
    COALESCE(SUM(ip.cantidad * ip.precio_unitario), 0)
        AS total_detalles,
    p.total - COALESCE(
        SUM(ip.cantidad * ip.precio_unitario), 0
    ) AS diferencia,
    CASE
        WHEN p.total = COALESCE(
            SUM(ip.cantidad * ip.precio_unitario), 0
        )
        THEN 'CORRECTO'
        ELSE 'REVISAR'
    END AS resultado
FROM pedido p
LEFT JOIN item_pedido ip
    ON ip.id_pedido = p.id_pedido
GROUP BY p.id_pedido, p.estado, p.total;

-- 4. Verificar los pagos asociados a los pedidos
SELECT
    p.id_pedido,
    p.total AS total_pedido,
    pa.monto AS monto_pago,
    pa.metodo,
    pa.estado AS estado_pago
FROM pedido p
LEFT JOIN pago pa
    ON pa.id_pedido = p.id_pedido
ORDER BY p.id_pedido;

-- 5. Detectar pedidos sin detalles
SELECT
    p.id_pedido
FROM pedido p
LEFT JOIN item_pedido ip
    ON ip.id_pedido = p.id_pedido
WHERE ip.id_pedido IS NULL;

-- 6. Verificar las relaciones de claves foraneas
SELECT
    TABLE_NAME AS tabla,
    COLUMN_NAME AS columna,
    CONSTRAINT_NAME AS restriccion,
    REFERENCED_TABLE_NAME AS tabla_referenciada,
    REFERENCED_COLUMN_NAME AS columna_referenciada
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = DATABASE()
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME, CONSTRAINT_NAME;

-- 7. Verificar el total de tablas de la base de datos
SELECT
    COUNT(*) AS total_tablas
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'floristeria_db'
  AND TABLE_TYPE = 'BASE TABLE';

-- ============================================================
-- FIN DE LAS CONSULTAS DE VERIFICACION
-- ============================================================
