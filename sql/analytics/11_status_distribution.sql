SELECT
    s.status_name,
    COUNT(*) AS total_employees,
    ROUND(
        100.0 * COUNT(*) / SUM(COUNT(*)) OVER (),
        2
    ) AS status_percentage
FROM dw.fact_employee_snapshot AS f
INNER JOIN dw.dim_status AS s
    ON f.status_key = s.status_key
GROUP BY s.status_name
ORDER BY total_employees DESC;