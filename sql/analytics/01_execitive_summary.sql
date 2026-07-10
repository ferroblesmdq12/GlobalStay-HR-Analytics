-- ============================================================
-- GlobalStay Hotels - HR Analytics
-- Consulta: Resumen ejecutivo de la plantilla
-- ============================================================

SELECT
    COUNT(*) AS total_employees,

    COUNT(*) FILTER (
        WHERE is_active = TRUE
    ) AS active_employees,

    COUNT(*) FILTER (
        WHERE is_active = FALSE
    ) AS inactive_employees,

    ROUND(
        100.0 * COUNT(*) FILTER (WHERE is_active = TRUE)
        / NULLIF(COUNT(*), 0),
        2
    ) AS active_employee_percentage,

    ROUND(
        AVG(tenure_months),
        2
    ) AS average_tenure_months,

    COUNT(*) FILTER (
        WHERE quality_issue_flag = TRUE
    ) AS employees_with_quality_issues

FROM dw.fact_employee_snapshot;