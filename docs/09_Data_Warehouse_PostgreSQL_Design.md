# GlobalStay Hotels

# Data Warehouse Design

**Proyecto:** HR Analytics Platform

**Documento:** 09 - PostgreSQL Data Warehouse Design

**Versión:** 1.0

**Fecha:** 30/06/2026

---

# 1. Objetivo

El objetivo de este documento es definir la arquitectura del Data Warehouse corporativo que soportará los procesos analíticos de Recursos Humanos de GlobalStay Hotels.

El modelo ha sido diseñado utilizando metodología dimensional (Star Schema), priorizando simplicidad, rendimiento y escalabilidad.

La fuente de información será la capa Silver generada por el Pipeline ETL.

---

# 2. Objetivos de negocio

El Data Warehouse permitirá responder preguntas como:

- ¿Cuántos empleados activos posee la compañía?
- ¿Cuál es el Headcount por hotel?
- ¿Cuál es la distribución por departamento?
- ¿Qué porcentaje de empleados tiene contratos permanentes?
- ¿Cuál es la antigüedad promedio?
- ¿Cuántos empleados existen por nivel jerárquico?
- ¿Qué hoteles presentan mayor rotación?
- ¿Cuántos registros presentan incidencias de calidad?

---

# 3. Fuente de datos

Fuente principal:

```
data/silver/hr_core_employees_clean.csv
```

Origen:

Pipeline ETL desarrollado durante el Sprint 3.

---

# 4. Arquitectura

```
Sistema HR Core

        │

        ▼

RAW Layer

        │

        ▼

Pipeline ETL

        │

        ▼

Silver Layer

        │

        ▼

PostgreSQL Data Warehouse

        │

        ▼

SQL Analytics

        │

        ▼

Power BI
```

---

# 5. Modelo Dimensional

El modelo estará compuesto por una tabla de hechos y cinco dimensiones.

## Dimensiones

- dim_employee
- dim_hotel
- dim_department
- dim_contract
- dim_date

## Tabla de hechos

- fact_employee_snapshot

---

# 6. Grano del modelo

Cada registro de la tabla de hechos representa:

```
Un empleado en la fecha de referencia del Data Warehouse.
```

Fecha de referencia:

```
10/06/2026
```

---

# 7. Dimensiones

## DimEmployee

Contendrá la información descriptiva del empleado.

Atributos:

- employee_key
- employee_id
- full_name
- gender
- birth_date
- hire_date
- termination_date
- status
- hierarchy_level
- age
- invalid_birth_date_flag
- inactive_without_termination_flag

---

## DimHotel

Atributos:

- hotel_key
- hotel_code
- hotel_name
- city
- country

---

## DimDepartment

Atributos:

- department_key
- department_code
- department_name

---

## DimContract

Atributos:

- contract_key
- contract_type

---

## DimDate

Atributos:

- date_key
- full_date
- year
- quarter
- month
- month_name
- week
- day
- day_name
- is_weekend

---

# 8. Tabla de hechos

## FactEmployeeSnapshot

Medidas y relaciones:

- snapshot_key
- employee_key
- hotel_key
- department_key
- contract_key
- date_key
- is_active
- tenure_months
- quality_issue_flag

---

# 9. Relaciones

```
DimEmployee

        │

        │

DimHotel ---- FactEmployeeSnapshot ---- DimDepartment

        │

        │

    DimContract

        │

        │

      DimDate
```

---

# 10. Indicadores soportados

El modelo permitirá calcular:

- Headcount
- Active Employees
- Inactive Employees
- Employees by Hotel
- Employees by Country
- Employees by Department
- Employees by Contract Type
- Average Age
- Average Tenure
- Quality Issues
- Employees by Hierarchy Level

---

# 11. Escalabilidad

El modelo fue diseñado para permitir la incorporación futura de nuevas dimensiones, entre ellas:

- DimPosition
- DimNationality
- DimCostCenter
- DimShift
- DimManager
- FactAbsence
- FactTraining
- FactPayroll

sin modificar la estructura principal del Data Warehouse.

---

# 12. Beneficios del modelo

Este diseño ofrece:

- simplicidad
- alto rendimiento
- baja redundancia
- fácil mantenimiento
- integración con herramientas BI
- escalabilidad

---

# Estado

**Diseño aprobado para implementación**

---

# Fin del documento