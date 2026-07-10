SELECT
    h.country,
    c.contract_type,
    hy.hierarchy_level,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (
        WHERE f.is_active = TRUE
    ) AS active_employees
FROM dw.fact_employee_snapshot AS f
INNER JOIN dw.dim_hotel AS h
    ON f.hotel_key = h.hotel_key
INNER JOIN dw.dim_contract AS c
    ON f.contract_key = c.contract_key
INNER JOIN dw.dim_hierarchy AS hy
    ON f.hierarchy_key = hy.hierarchy_key
GROUP BY
    h.country,
    c.contract_type,
    hy.hierarchy_level
ORDER BY
    h.country,
    total_employees DESC;