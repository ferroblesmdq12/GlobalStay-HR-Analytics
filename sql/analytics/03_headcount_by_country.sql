-- ============================================================
-- Consulta: Headcount por país
-- ============================================================

SELECT
    h.country,

    COUNT(*) AS total_employees,

    COUNT(*) FILTER (
        WHERE f.is_active = TRUE
    ) AS active_employees,

    ROUND(
        100.0 * COUNT(*)
        / SUM(COUNT(*)) OVER (),
        2
    ) AS workforce_percentage

FROM dw.fact_employee_snapshot AS f

INNER JOIN dw.dim_hotel AS h
    ON f.hotel_key = h.hotel_key

GROUP BY h.country

ORDER BY total_employees DESC;