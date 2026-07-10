-- ============================================================
-- Consulta: Distribución por nivel jerárquico
-- ============================================================

SELECT
    h.hierarchy_level,

    COUNT(*) AS total_employees,

    COUNT(*) FILTER (
        WHERE f.is_active = TRUE
    ) AS active_employees,

    ROUND(
        100.0 * COUNT(*)
        / SUM(COUNT(*)) OVER (),
        2
    ) AS hierarchy_percentage

FROM dw.fact_employee_snapshot AS f

INNER JOIN dw.dim_hierarchy AS h
    ON f.hierarchy_key = h.hierarchy_key

GROUP BY h.hierarchy_level

ORDER BY total_employees DESC;