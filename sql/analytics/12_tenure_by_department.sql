SELECT
    d.department_code,
    d.department_name,
    COUNT(*) AS total_employees,
    ROUND(AVG(f.tenure_months), 2) AS average_tenure_months,
    ROUND(AVG(f.tenure_months) / 12.0, 2) AS average_tenure_years,
    MIN(f.tenure_months) AS minimum_tenure_months,
    MAX(f.tenure_months) AS maximum_tenure_months
FROM dw.fact_employee_snapshot AS f
INNER JOIN dw.dim_department AS d
    ON f.department_key = d.department_key
GROUP BY
    d.department_code,
    d.department_name
ORDER BY average_tenure_months DESC;