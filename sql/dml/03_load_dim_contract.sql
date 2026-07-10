-- ============================================================
-- GlobalStay Hotels - HR Analytics Platform
-- Sprint 4 - PostgreSQL Data Warehouse
--
-- Script: 11_load_dim_contract.sql
-- Objetivo:
-- Poblar la dimensión Contract desde staging.
--
-- Autor: Fernando Raúl Robles
-- ============================================================

INSERT INTO dw.dim_contract (
    contract_type
)
SELECT DISTINCT
    contract_type
FROM staging.hr_core_employees
ON CONFLICT (contract_type) DO NOTHING;

SELECT *
FROM dw.dim_contract
ORDER BY contract_key;

SELECT
    contract_type,
    COUNT(*) AS employees
FROM staging.hr_core_employees
GROUP BY contract_type
ORDER BY employees DESC;