-- ============================================================
-- GlobalStay Hotels - HR Analytics Platform
-- Sprint 4 - PostgreSQL Data Warehouse
--
-- Script: 03_create_dimensions.sql
-- Objetivo:
-- Crear las tablas de dimensiones del Data Warehouse.
--
-- Autor: Fernando Raúl Robles
-- Fecha: 30/06/2026
-- Versión: 1.0
-- ============================================================


-- ============================================================
-- Dimension: dim_employee
-- ============================================================

CREATE TABLE IF NOT EXISTS dw.dim_employee (
    employee_key INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_id VARCHAR(20) NOT NULL UNIQUE,
    full_name VARCHAR(150) NOT NULL,
    gender VARCHAR(20) NOT NULL,
    birth_date DATE
);

COMMENT ON TABLE dw.dim_employee IS
'Dimensión de empleados. Contiene atributos propios de la persona.';

COMMENT ON COLUMN dw.dim_employee.employee_key IS
'Clave sustituta técnica del Data Warehouse.';

COMMENT ON COLUMN dw.dim_employee.employee_id IS
'Identificador de negocio del empleado proveniente del sistema HR Core.';

COMMENT ON COLUMN dw.dim_employee.full_name IS
'Nombre completo del empleado.';

COMMENT ON COLUMN dw.dim_employee.gender IS
'Género estandarizado del empleado.';

COMMENT ON COLUMN dw.dim_employee.birth_date IS
'Fecha de nacimiento del empleado.';

-- ============================================================
-- Dimension: dim_hotel
-- ============================================================

CREATE TABLE IF NOT EXISTS dw.dim_hotel (
    hotel_key INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    hotel_code VARCHAR(20) NOT NULL UNIQUE,
    hotel_name VARCHAR(150) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);

COMMENT ON TABLE dw.dim_hotel IS
'Dimensión de hoteles. Contiene el catálogo maestro de establecimientos.';


-- ============================================================
-- Dimension: dim_department
-- ============================================================

CREATE TABLE IF NOT EXISTS dw.dim_department (
    department_key INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department_code VARCHAR(20) NOT NULL UNIQUE,
    department_name VARCHAR(100) NOT NULL
);

COMMENT ON TABLE dw.dim_department IS
'Dimensión de departamentos organizacionales.';


-- ============================================================
-- Dimension: dim_contract
-- ============================================================

CREATE TABLE IF NOT EXISTS dw.dim_contract (
    contract_key INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    contract_type VARCHAR(50) NOT NULL UNIQUE
);

COMMENT ON TABLE dw.dim_contract IS
'Dimensión de tipos de contrato.';


-- ============================================================
-- Dimension: dim_status
-- ============================================================

CREATE TABLE IF NOT EXISTS dw.dim_status (
    status_key INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL UNIQUE
);

COMMENT ON TABLE dw.dim_status IS
'Dimensión de estados laborales del empleado.';


-- ============================================================
-- Dimension: dim_hierarchy
-- ============================================================

CREATE TABLE IF NOT EXISTS dw.dim_hierarchy (
    hierarchy_key INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    hierarchy_level VARCHAR(50) NOT NULL UNIQUE
);

COMMENT ON TABLE dw.dim_hierarchy IS
'Dimensión de niveles jerárquicos del empleado.';


-- ============================================================
-- Dimension: dim_date
-- ============================================================

CREATE TABLE IF NOT EXISTS dw.dim_date (
    date_key INTEGER PRIMARY KEY,
    full_date DATE NOT NULL UNIQUE,
    year INTEGER NOT NULL,
    quarter INTEGER NOT NULL,
    month INTEGER NOT NULL,
    month_name VARCHAR(20) NOT NULL,
    week INTEGER NOT NULL,
    day INTEGER NOT NULL,
    day_name VARCHAR(20) NOT NULL,
    is_weekend BOOLEAN NOT NULL
);

COMMENT ON TABLE dw.dim_date IS
'Dimensión calendario utilizada para análisis temporal.';