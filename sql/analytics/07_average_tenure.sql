-- ============================================================
-- Consulta: Antigüedad promedio
-- ============================================================

SELECT
    ROUND(
        AVG(tenure_months),
        2
    ) AS average_tenure_months,

    ROUND(
        AVG(tenure_months) / 12.0,
        2
    ) AS average_tenure_years,

    MIN(tenure_months) AS minimum_tenure_months,

    MAX(tenure_months) AS maximum_tenure_months

FROM dw.fact_employee_snapshot;


SELECT
    h.hotel_name,

    ROUND(
        AVG(f.tenure_months),
        2
    ) AS average_tenure_months,

    ROUND(
        AVG(f.tenure_months) / 12.0,
        2
    ) AS average_tenure_years


--Por Hotel
FROM dw.fact_employee_snapshot AS f

INNER JOIN dw.dim_hotel AS h
    ON f.hotel_key = h.hotel_key

GROUP BY h.hotel_name

ORDER BY average_tenure_months DESC;