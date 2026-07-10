SELECT
    h.hotel_code,
    h.hotel_name,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (
        WHERE f.quality_issue_flag = TRUE
    ) AS employees_with_quality_issues,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE f.quality_issue_flag = TRUE
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS quality_issue_percentage
FROM dw.fact_employee_snapshot AS f
INNER JOIN dw.dim_hotel AS h
    ON f.hotel_key = h.hotel_key
GROUP BY
    h.hotel_code,
    h.hotel_name
ORDER BY quality_issue_percentage DESC;