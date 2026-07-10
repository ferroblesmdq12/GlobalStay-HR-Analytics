-- ============================================================
-- Consulta: Headcount por departamento
-- ============================================================

SELECT
    d.department_code,
    d.department_name,

    COUNT(*) AS total_employees,

    COUNT(*) FILTER (
        WHERE f.is_active = TRUE
    ) AS active_employees,

    ROUND(
        AVG(f.tenure_months),
        2
    ) AS average_tenure_months

FROM dw.fact_employee_snapshot AS f

INNER JOIN dw.dim_department AS d
    ON f.department_key = d.department_key

GROUP BY
    d.department_code,
    d.department_name

ORDER BY total_employees DESC;