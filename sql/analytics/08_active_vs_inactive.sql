-- ============================================================
-- Consulta: Empleados activos frente a inactivos
-- ============================================================

SELECT
    CASE
        WHEN is_active = TRUE THEN 'Active'
        ELSE 'Inactive'
    END AS employee_group,

    COUNT(*) AS total_employees,

    ROUND(
        100.0 * COUNT(*)
        / SUM(COUNT(*)) OVER (),
        2
    ) AS employee_percentage

FROM dw.fact_employee_snapshot

GROUP BY is_active

ORDER BY is_active DESC;