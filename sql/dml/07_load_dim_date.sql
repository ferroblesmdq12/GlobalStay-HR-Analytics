-- ============================================================
-- GlobalStay Hotels - HR Analytics Platform
-- Sprint 4 - PostgreSQL Data Warehouse
--
-- Script: 15_load_dim_date.sql
-- Objetivo:
-- Poblar la dimensión Date.
--
-- Autor: Fernando Raúl Robles
-- ============================================================

INSERT INTO dw.dim_date (
    date_key,
    full_date,
    year,
    quarter,
    month,
    month_name,
    week,
    day,
    day_name,
    is_weekend
)
SELECT
    TO_CHAR(date_value, 'YYYYMMDD')::INTEGER AS date_key,
    date_value::DATE AS full_date,
    EXTRACT(YEAR FROM date_value)::INTEGER AS year,
    EXTRACT(QUARTER FROM date_value)::INTEGER AS quarter,
    EXTRACT(MONTH FROM date_value)::INTEGER AS month,
    TRIM(TO_CHAR(date_value, 'Month')) AS month_name,
    EXTRACT(WEEK FROM date_value)::INTEGER AS week,
    EXTRACT(DAY FROM date_value)::INTEGER AS day,
    TRIM(TO_CHAR(date_value, 'Day')) AS day_name,
    CASE
        WHEN EXTRACT(ISODOW FROM date_value) IN (6, 7) THEN TRUE
        ELSE FALSE
    END AS is_weekend
FROM GENERATE_SERIES(
    DATE '2020-01-01',
    DATE '2026-06-10',
    INTERVAL '1 day'
) AS date_value
ON CONFLICT (date_key) DO NOTHING;

SELECT COUNT(*)
FROM dw.dim_date;