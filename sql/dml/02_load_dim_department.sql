-- ============================================================
-- GlobalStay Hotels - HR Analytics Platform
-- Sprint 4 - PostgreSQL Data Warehouse
--
-- Script: 10_load_dim_department.sql
-- Objetivo:
-- Poblar la dimensión Department desde staging.
--
-- Autor: Fernando Raúl Robles
-- ============================================================

INSERT INTO dw.dim_department (
    department_code,
    department_name
)
SELECT DISTINCT ON (department_code)
    department_code,
    department_name
FROM staging.hr_core_employees
ORDER BY department_code
ON CONFLICT (department_code) DO NOTHING;

SELECT *
FROM dw.dim_department
ORDER BY department_key;

SELECT
    department_code,
    COUNT(DISTINCT department_name) AS department_names
FROM staging.hr_core_employees
GROUP BY department_code
ORDER BY department_code;