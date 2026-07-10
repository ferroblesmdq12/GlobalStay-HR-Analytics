SELECT COUNT(*)
FROM dw.fact_employee_snapshot f
LEFT JOIN dw.dim_employee d
ON f.employee_key = d.employee_key
WHERE d.employee_key IS NULL;