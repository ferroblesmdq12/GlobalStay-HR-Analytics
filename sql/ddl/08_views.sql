-- ============================================================
-- GlobalStay Hotels - HR Analytics Platform
-- Sprint 4 - PostgreSQL Data Warehouse
--
-- Script: 07_views.sql
-- Objetivo:
-- Crear vistas analíticas para facilitar el consumo del Data Warehouse.
--
-- Autor: Fernando Raúl Robles
-- Fecha: 30/06/2026
-- Versión: 1.0
-- ============================================================


-- ============================================================
-- View: vw_employee_snapshot
-- ============================================================

CREATE OR REPLACE VIEW dw.vw_employee_snapshot AS
SELECT
    f.snapshot_key,
    dt.full_date AS snapshot_date,

    e.employee_id,
    e.full_name,
    e.gender,
    e.birth_date,

    h.hotel_code,
    h.hotel_name,
    h.city,
    h.country,

    d.department_code,
    d.department_name,

    c.contract_type,

    s.status_name,

    hy.hierarchy_level,

    f.is_active,
    f.tenure_months,
    f.quality_issue_flag

FROM dw.fact_employee_snapshot f

LEFT JOIN dw.dim_date dt
    ON f.date_key = dt.date_key

LEFT JOIN dw.dim_employee e
    ON f.employee_key = e.employee_key

LEFT JOIN dw.dim_hotel h
    ON f.hotel_key = h.hotel_key

LEFT JOIN dw.dim_department d
    ON f.department_key = d.department_key

LEFT JOIN dw.dim_contract c
    ON f.contract_key = c.contract_key

LEFT JOIN dw.dim_status s
    ON f.status_key = s.status_key

LEFT JOIN dw.dim_hierarchy hy
    ON f.hierarchy_key = hy.hierarchy_key;

    SELECT table_name
FROM information_schema.views
WHERE table_schema = 'dw'
ORDER BY table_name;