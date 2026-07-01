-- ============================================================
-- GlobalStay Hotels - HR Analytics Platform
-- Sprint 4 - PostgreSQL Data Warehouse
--
-- Script: 01_create_database.sql
-- Objetivo:
-- Crear la base de datos corporativa del Data Warehouse.
--
-- Autor: Fernando Raúl Robles
-- Fecha: 30/06/2026
-- Versión: 1.0
-- ============================================================

CREATE DATABASE globalstay_dw
WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    TEMPLATE = template0;