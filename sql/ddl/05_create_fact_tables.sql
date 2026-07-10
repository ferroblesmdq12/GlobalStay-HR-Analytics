-- ============================================================
-- GlobalStay Hotels - HR Analytics Platform
-- Sprint 4 - PostgreSQL Data Warehouse
--
-- Script: 04_create_fact_tables.sql
-- Objetivo:
-- Crear la tabla de hechos del Data Warehouse.
--
-- Autor: Fernando Raúl Robles
-- Fecha: 30/06/2026
-- Versión: 1.0
-- ============================================================


-- ============================================================
-- Fact Table: fact_employee_snapshot
-- ============================================================

CREATE TABLE IF NOT EXISTS dw.fact_employee_snapshot (

    snapshot_key INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    date_key INTEGER NOT NULL,

    employee_key INTEGER NOT NULL,

    hotel_key INTEGER NOT NULL,

    department_key INTEGER NOT NULL,

    contract_key INTEGER NOT NULL,

    status_key INTEGER NOT NULL,

    hierarchy_key INTEGER NOT NULL,

    is_active BOOLEAN NOT NULL,

    tenure_months INTEGER NOT NULL,

    quality_issue_flag BOOLEAN NOT NULL

);

COMMENT ON TABLE dw.fact_employee_snapshot IS
'Tabla de hechos que representa una fotografía del estado de cada empleado en una fecha determinada.';


SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'dw'
ORDER BY table_name;