-- ============================================================
-- Consulta: Distribución por tipo de contrato
-- ============================================================

SELECT
    c.contract_type,

    COUNT(*) AS total_employees,

    COUNT(*) FILTER (
        WHERE f.is_active = TRUE
    ) AS active_employees,

    ROUND(
        100.0 * COUNT(*)
        / SUM(COUNT(*)) OVER (),
        2
    ) AS contract_percentage

FROM dw.fact_employee_snapshot AS f

INNER JOIN dw.dim_contract AS c
    ON f.contract_key = c.contract_key

GROUP BY c.contract_type

ORDER BY total_employees DESC;