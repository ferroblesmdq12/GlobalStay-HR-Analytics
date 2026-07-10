-- ============================================================
-- GlobalStay Hotels - HR Analytics Platform
-- Sprint 4 - PostgreSQL Data Warehouse
--
-- Script: 12_load_dim_status.sql
-- Objetivo:
-- Poblar la dimensión Status desde staging.
--
-- Autor: Fernando Raúl Robles
-- ============================================================

INSERT INTO dw.dim_status (
    status_name
)
SELECT DISTINCT
    status
FROM staging.hr_core_employees
ON CONFLICT (status_name) DO NOTHING;

SELECT *
FROM dw.dim_status
ORDER BY status_key;