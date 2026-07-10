-- ============================================================
-- GlobalStay Hotels - HR Analytics Platform
-- Sprint 4 - PostgreSQL Data Warehouse
--
-- Script: 13_load_dim_hierarchy.sql
-- Objetivo:
-- Poblar la dimensión Hierarchy desde staging.
--
-- Autor: Fernando Raúl Robles
-- ============================================================

INSERT INTO dw.dim_hierarchy (
    hierarchy_level
)
SELECT DISTINCT
    hierarchy_level
FROM staging.hr_core_employees
ON CONFLICT (hierarchy_level) DO NOTHING;

SELECT *
FROM dw.dim_hierarchy
ORDER BY hierarchy_key;