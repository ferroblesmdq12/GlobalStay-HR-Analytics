-- ============================================================
-- GlobalStay Hotels - HR Analytics Platform
-- Sprint 4 - PostgreSQL Data Warehouse
--
-- Script: 03_create_staging.sql
-- Objetivo:
-- Crear la tabla staging para cargar el dataset Silver.
-- ============================================================

DROP TABLE IF EXISTS staging.hr_core_employees;

CREATE TABLE staging.hr_core_employees (
    employee_id VARCHAR(20),
    first_name VARCHAR(100),
    last_name VARCHAR(150),
    gender VARCHAR(20),
    birth_date DATE,
    hire_date DATE,
    termination_date DATE,
    status VARCHAR(50),
    hotel_code VARCHAR(20),
    hotel_name VARCHAR(150),
    city VARCHAR(100),
    country VARCHAR(100),
    department_code VARCHAR(20),
    department_name VARCHAR(100),
    contract_type VARCHAR(50),
    hierarchy_level VARCHAR(50),
    age INTEGER,
    invalid_birth_date_flag BOOLEAN,
    inactive_without_termination_flag BOOLEAN
);

COMMENT ON TABLE staging.hr_core_employees IS
'Tabla staging que almacena los datos limpios de HR Core provenientes de la capa Silver.';

SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema IN ('staging', 'dw')
ORDER BY table_schema, table_name;

SELECT COUNT(*)
FROM staging.hr_core_employees;

