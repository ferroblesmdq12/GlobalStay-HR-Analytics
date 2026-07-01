-- ============================================================
-- GlobalStay Hotels - HR Analytics Platform
-- Sprint 4 - PostgreSQL Data Warehouse
--
-- Script: 05_constraints.sql
-- Objetivo:
-- Crear restricciones de integridad referencial del Data Warehouse.
--
-- Autor: Fernando Raúl Robles
-- Fecha: 30/06/2026
-- Versión: 1.0
-- ============================================================


-- ============================================================
-- Foreign Keys - fact_employee_snapshot
-- ============================================================

ALTER TABLE dw.fact_employee_snapshot
ADD CONSTRAINT fk_fact_employee_snapshot_date
FOREIGN KEY (date_key)
REFERENCES dw.dim_date(date_key);

ALTER TABLE dw.fact_employee_snapshot
ADD CONSTRAINT fk_fact_employee_snapshot_employee
FOREIGN KEY (employee_key)
REFERENCES dw.dim_employee(employee_key);

ALTER TABLE dw.fact_employee_snapshot
ADD CONSTRAINT fk_fact_employee_snapshot_hotel
FOREIGN KEY (hotel_key)
REFERENCES dw.dim_hotel(hotel_key);

ALTER TABLE dw.fact_employee_snapshot
ADD CONSTRAINT fk_fact_employee_snapshot_department
FOREIGN KEY (department_key)
REFERENCES dw.dim_department(department_key);

ALTER TABLE dw.fact_employee_snapshot
ADD CONSTRAINT fk_fact_employee_snapshot_contract
FOREIGN KEY (contract_key)
REFERENCES dw.dim_contract(contract_key);

ALTER TABLE dw.fact_employee_snapshot
ADD CONSTRAINT fk_fact_employee_snapshot_status
FOREIGN KEY (status_key)
REFERENCES dw.dim_status(status_key);

ALTER TABLE dw.fact_employee_snapshot
ADD CONSTRAINT fk_fact_employee_snapshot_hierarchy
FOREIGN KEY (hierarchy_key)
REFERENCES dw.dim_hierarchy(hierarchy_key);

SELECT
    conname AS constraint_name,
    conrelid::regclass AS table_name
FROM pg_constraint
WHERE connamespace = 'dw'::regnamespace
  AND contype = 'f'
ORDER BY conname;