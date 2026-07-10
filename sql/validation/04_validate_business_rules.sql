SELECT
    COUNT(*)
FROM dw.fact_employee_snapshot
WHERE tenure_months < 0;

SELECT
    COUNT(*)
FROM dw.fact_employee_snapshot
WHERE employee_key IS NULL;