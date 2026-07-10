-- ============================================================
-- Consulta: Distribución por género
-- ============================================================

SELECT
    e.gender,

    COUNT(*) AS total_employees,

    COUNT(*) FILTER (
        WHERE f.is_active = TRUE
    ) AS active_employees,

    ROUND(
        100.0 * COUNT(*)
        / SUM(COUNT(*)) OVER (),
        2
    ) AS gender_percentage

FROM dw.fact_employee_snapshot AS f

INNER JOIN dw.dim_employee AS e
    ON f.employee_key = e.employee_key

GROUP BY e.gender

ORDER BY total_employees DESC;