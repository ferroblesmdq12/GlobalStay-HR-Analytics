-- ============================================================
-- GlobalStay Hotels - HR Analytics Platform
-- Sprint 4 - PostgreSQL Data Warehouse
--
-- Script: 09_load_dim_hotel.sql
-- Objetivo:
-- Poblar la dimensión Hotel desde staging.
--
-- Autor: Fernando Raúl Robles
-- ============================================================

INSERT INTO dw.dim_hotel (
    hotel_code,
    hotel_name,
    city,
    country
)
SELECT DISTINCT ON (hotel_code)
    hotel_code,
    hotel_name,
    city,
    country
FROM staging.hr_core_employees
ORDER BY hotel_code
ON CONFLICT (hotel_code) DO NOTHING;