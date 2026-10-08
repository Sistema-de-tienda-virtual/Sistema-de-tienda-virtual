-- ============================================================
-- FASE 4: CONSULTAS DE VERIFICACIÓN
-- Proyecto: Floristería Aroma de Rosas
-- Base de datos: floristeria_db
-- ============================================================
USE floristeria_db;
-- 1. Verificar tablas
SHOW TABLES;
-- 2. Verificar cantidad de registros
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
SELECT 'pago', COUNT(*) FROM pago;

-- 3. Verificar totales de los pedidos
SELECT
    p.id_pedido,
    p.total AS total_pedido,
    COALESCE(SUM(ip.cantidad * ip.precio_unitario), 0) AS total_detalles,
    CASE
        WHEN p.total = COALESCE(SUM(ip.cantidad * ip.precio_unitario), 0)
        THEN 'CORRECTO'
        ELSE 'REVISAR'
    END AS resultado
FROM pedido p
LEFT JOIN item_pedido ip
    ON ip.id_pedido = p.id_pedido
GROUP BY p.id_pedido, p.total;

-- 4. Verificar pagos
SELECT
    p.id_pedido,
    p.total AS total_pedido,
    pa.monto AS monto_pago,
    pa.metodo,
    pa.estado
FROM pedido p
LEFT JOIN pago pa
    ON pa.id_pedido = p.id_pedido;

-- 5. Verificar claves foráneas
SELECT
    TABLE_NAME AS tabla,
    COLUMN_NAME AS columna,
    REFERENCED_TABLE_NAME AS tabla_referenciada,
    REFERENCED_COLUMN_NAME AS columna_referenciada
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'floristeria_db'
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME;

-- 6. Verificar total de tablas
SELECT COUNT(*) AS total_tablas
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'floristeria_db'
  AND TABLE_TYPE = 'BASE TABLE';

-- ============================================================
-- FIN DE LAS CONSULTAS DE VERIFICACIÓN
-- ============================================================