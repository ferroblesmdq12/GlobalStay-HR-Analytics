-- ============================================================
-- GlobalStay Hotels - HR Analytics Platform
-- Sprint 4 - PostgreSQL Data Warehouse
--
-- Script: 16_load_fact_employee_snapshot.sql
-- Objetivo:
-- Poblar la tabla de hechos Employee Snapshot desde staging.
--
-- Autor: Fernando Raúl Robles
-- Fecha de snapshot: 10/06/2026
-- ============================================================

WITH employee_snapshot AS (
    SELECT
        e.employee_key,
        h.hotel_key,
        d.department_key,
        c.contract_key,
        s.status_key,
        hy.hierarchy_key,
        dt.date_key,

        CASE
            WHEN stg.status = 'Active' THEN TRUE
            ELSE FALSE
        END AS is_active,

        (
            EXTRACT(
                YEAR FROM AGE(
                    COALESCE(
                        NULLIF(stg.termination_date, '')::DATE,
                        DATE '2026-06-10'
                    ),
                    NULLIF(stg.hire_date, '')::DATE
                )
            ) * 12
            +
            EXTRACT(
                MONTH FROM AGE(
                    COALESCE(
                        NULLIF(stg.termination_date, '')::DATE,
                        DATE '2026-06-10'
                    ),
                    NULLIF(stg.hire_date, '')::DATE
                )
            )
        )::INTEGER AS tenure_months,

        (
            COALESCE(stg.invalid_birth_date_flag, FALSE)
            OR
            COALESCE(stg.inactive_without_termination_flag, FALSE)
        ) AS quality_issue_flag

    FROM staging.hr_core_employees AS stg

    INNER JOIN dw.dim_employee AS e
        ON e.employee_id = stg.employee_id

    INNER JOIN dw.dim_hotel AS h
        ON h.hotel_code = stg.hotel_code

    INNER JOIN dw.dim_department AS d
        ON d.department_code = stg.department_code

    INNER JOIN dw.dim_contract AS c
        ON c.contract_type = stg.contract_type

    INNER JOIN dw.dim_status AS s
        ON s.status_name = stg.status

    INNER JOIN dw.dim_hierarchy AS hy
        ON hy.hierarchy_level = stg.hierarchy_level

    INNER JOIN dw.dim_date AS dt
        ON dt.full_date = DATE '2026-06-10'
)

INSERT INTO dw.fact_employee_snapshot (
    date_key,
    employee_key,
    hotel_key,
    department_key,
    contract_key,
    status_key,
    hierarchy_key,
    is_active,
    tenure_months,
    quality_issue_flag
)
SELECT
    es.date_key,
    es.employee_key,
    es.hotel_key,
    es.department_key,
    es.contract_key,
    es.status_key,
    es.hierarchy_key,
    es.is_active,
    es.tenure_months,
    es.quality_issue_flag
FROM employee_snapshot AS es
WHERE NOT EXISTS (
    SELECT 1
    FROM dw.fact_employee_snapshot AS fact
    WHERE fact.date_key = es.date_key
      AND fact.employee_key = es.employee_key
);


SELECT COUNT(*)
FROM dw.fact_employee_snapshot;

SELECT
    COUNT(*) AS total_facts,
    COUNT(DISTINCT employee_key) AS unique_employees,
    MIN(tenure_months) AS minimum_tenure,
    MAX(tenure_months) AS maximum_tenure,
    COUNT(*) FILTER (WHERE is_active) AS active_employees,
    COUNT(*) FILTER (WHERE quality_issue_flag) AS quality_issues
FROM dw.fact_employee_snapshot;

SELECT *
FROM dw.vw_employee_snapshot
ORDER BY snapshot_key
LIMIT 10;