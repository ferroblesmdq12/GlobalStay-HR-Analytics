-- ============================================================
-- GlobalStay Hotels
-- Data Warehouse Validation
-- Dimension Validation
-- ============================================================

SELECT 'dim_employee' AS table_name, COUNT(*) AS records
FROM dw.dim_employee

UNION ALL

SELECT 'dim_hotel', COUNT(*)
FROM dw.dim_hotel

UNION ALL

SELECT 'dim_department', COUNT(*)
FROM dw.dim_department

UNION ALL

SELECT 'dim_contract', COUNT(*)
FROM dw.dim_contract

UNION ALL

SELECT 'dim_status', COUNT(*)
FROM dw.dim_status

UNION ALL

SELECT 'dim_hierarchy', COUNT(*)
FROM dw.dim_hierarchy

UNION ALL

SELECT 'dim_date', COUNT(*)
FROM dw.dim_date;