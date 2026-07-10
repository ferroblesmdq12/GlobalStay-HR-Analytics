-- ============================================================
-- GlobalStay Hotels - HR Analytics Platform
-- Sprint 4 - PostgreSQL Data Warehouse
--
-- Script: 14_load_dim_employee.sql
-- Objetivo:
-- Poblar la dimensión Employee desde staging.
--
-- Autor: Fernando Raúl Robles
-- ============================================================


INSERT INTO dw.dim_employee (
    employee_id,
    full_name,
    gender,
    birth_date
)
SELECT DISTINCT ON (employee_id)
    employee_id,
    first_name || ' ' || last_name AS full_name,
    gender,
    CAST(birth_date AS DATE)
FROM staging.hr_core_employees
ORDER BY employee_id

ON CONFLICT (employee_id)
DO NOTHING;


SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'dw'
AND table_name = 'dim_employee';

SELECT
    constraint_name,
    constraint_type
FROM information_schema.table_constraints
WHERE table_schema = 'dw'
AND table_name = 'dim_employee';