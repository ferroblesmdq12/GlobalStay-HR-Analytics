-- ============================================================
-- GlobalStay Hotels - HR Analytics Platform
-- Sprint 4 - PostgreSQL Data Warehouse
--
-- Script: 06_indexes.sql
-- Objetivo:
-- Crear índices para optimizar consultas analíticas.
--
-- Autor: Fernando Raúl Robles
-- Fecha: 30/06/2026
-- Versión: 1.0
-- ============================================================


-- ============================================================
-- Indexes - fact_employee_snapshot
-- ============================================================

CREATE INDEX IF NOT EXISTS idx_fact_employee_snapshot_date
ON dw.fact_employee_snapshot(date_key);

CREATE INDEX IF NOT EXISTS idx_fact_employee_snapshot_employee
ON dw.fact_employee_snapshot(employee_key);

CREATE INDEX IF NOT EXISTS idx_fact_employee_snapshot_hotel
ON dw.fact_employee_snapshot(hotel_key);

CREATE INDEX IF NOT EXISTS idx_fact_employee_snapshot_department
ON dw.fact_employee_snapshot(department_key);

CREATE INDEX IF NOT EXISTS idx_fact_employee_snapshot_contract
ON dw.fact_employee_snapshot(contract_key);

CREATE INDEX IF NOT EXISTS idx_fact_employee_snapshot_status
ON dw.fact_employee_snapshot(status_key);

CREATE INDEX IF NOT EXISTS idx_fact_employee_snapshot_hierarchy
ON dw.fact_employee_snapshot(hierarchy_key);


-- ============================================================
-- Indexes - Common filters
-- ============================================================

CREATE INDEX IF NOT EXISTS idx_fact_employee_snapshot_is_active
ON dw.fact_employee_snapshot(is_active);

CREATE INDEX IF NOT EXISTS idx_fact_employee_snapshot_quality_issue
ON dw.fact_employee_snapshot(quality_issue_flag);

SELECT
    schemaname,
    tablename,
    indexname
FROM pg_indexes
WHERE schemaname = 'dw'
ORDER BY tablename, indexname;

