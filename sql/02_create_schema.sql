-- ============================================================
-- GlobalStay Hotels - HR Analytics Platform
-- Sprint 4 - PostgreSQL Data Warehouse
--
-- Script: 02_create_schema.sql
-- Objetivo:
-- Crear el esquema del Data Warehouse.
--
-- Autor: Fernando Raúl Robles
-- Fecha: 30/06/2026
-- Versión: 1.0
-- ============================================================

CREATE SCHEMA IF NOT EXISTS dw;

COMMENT ON SCHEMA dw IS
'Esquema principal del Data Warehouse de GlobalStay Hotels.';