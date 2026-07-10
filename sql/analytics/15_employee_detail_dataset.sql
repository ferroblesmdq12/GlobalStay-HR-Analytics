SELECT
    snapshot_date,
    employee_id,
    full_name,
    gender,
    birth_date,
    hotel_code,
    hotel_name,
    city,
    country,
    department_code,
    department_name,
    contract_type,
    status_name,
    hierarchy_level,
    is_active,
    tenure_months,
    quality_issue_flag
FROM dw.vw_employee_snapshot
ORDER BY
    hotel_name,
    department_name,
    full_name;