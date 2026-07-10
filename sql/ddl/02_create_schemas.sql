-- ============================================================
-- GlobalStay Hotels - HR Analytics Platform
-- Sprint 4 - PostgreSQL Data Warehouse
--
-- Script: 02_create_schema.sql
-- Objetivo:
-- Crear los esquemas principales de la plataforma de datos.
-- ============================================================

CREATE SCHEMA IF NOT EXISTS staging;

COMMENT ON SCHEMA staging IS
'Esquema temporal para almacenar datos provenientes de la capa Silver antes de cargar el Data Warehouse.';

CREATE SCHEMA IF NOT EXISTS dw;

COMMENT ON SCHEMA dw IS
'Esquema principal del Data Warehouse de GlobalStay Hotels.';