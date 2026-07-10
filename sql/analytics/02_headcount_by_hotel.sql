-- ============================================================
-- Consulta: Headcount por hotel
-- ============================================================

SELECT
    h.hotel_code,
    h.hotel_name,
    h.city,
    h.country,

    COUNT(*) AS total_employees,

    COUNT(*) FILTER (
        WHERE f.is_active = TRUE
    ) AS active_employees,

    COUNT(*) FILTER (
        WHERE f.is_active = FALSE
    ) AS inactive_employees

FROM dw.fact_employee_snapshot AS f

INNER JOIN dw.dim_hotel AS h
    ON f.hotel_key = h.hotel_key

GROUP BY
    h.hotel_code,
    h.hotel_name,
    h.city,
    h.country

ORDER BY total_employees DESC;