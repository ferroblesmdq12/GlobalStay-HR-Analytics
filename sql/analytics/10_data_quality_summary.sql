-- ============================================================
-- Consulta: Resumen de calidad del dato
-- ============================================================

SELECT
    COUNT(*) AS total_employees,

    COUNT(*) FILTER (
        WHERE quality_issue_flag = TRUE
    ) AS employees_with_quality_issues,

    COUNT(*) FILTER (
        WHERE quality_issue_flag = FALSE
    ) AS employees_without_quality_issues,

    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE quality_issue_flag = TRUE
        )
        / NULLIF(COUNT(*), 0),
        2
    ) AS quality_issue_percentage

FROM dw.fact_employee_snapshot;


-- Ejecutar por separado

SELECT
    COUNT(*) FILTER (
        WHERE stg.invalid_birth_date_flag = TRUE
    ) AS invalid_birth_dates,

    COUNT(*) FILTER (
        WHERE stg.inactive_without_termination_flag = TRUE
    ) AS inactive_without_termination,

    COUNT(*) FILTER (
        WHERE stg.invalid_birth_date_flag = TRUE
          AND stg.inactive_without_termination_flag = TRUE
    ) AS employees_with_both_issues

FROM staging.hr_core_employees AS stg;