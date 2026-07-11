# GlobalStay Hotels – PostgreSQL Data Warehouse Design

## Overview

This document describes the PostgreSQL Data Warehouse implemented for the GlobalStay Hotels HR Analytics Platform.

The solution follows a dimensional modeling approach (Kimball Star Schema) and provides a centralized repository for analytical reporting and Business Intelligence.

The Data Warehouse integrates validated HR Core information through a modular ETL pipeline developed in Python.

---

# Architecture

```
Operational Systems
        │
        ▼
RAW Layer (CSV Files)
        │
        ▼
Python ETL Pipeline
        │
        ▼
Silver Layer
        │
        ▼
PostgreSQL Staging
        │
        ▼
Enterprise Data Warehouse
        │
        ▼
Analytical View
        │
        ▼
SQL Analytics
        │
        ▼
Power BI Dashboard
```

---

# Database Structure

The PostgreSQL implementation is organized into two schemas.

## staging

Temporary storage for validated data loaded from the ETL pipeline.

Current table:

- hr_core_employees

---

## dw

Enterprise analytical repository.

Current objects:

### Dimension Tables

- dim_employee
- dim_hotel
- dim_department
- dim_contract
- dim_status
- dim_hierarchy
- dim_date

### Fact Table

- fact_employee_snapshot

### View

- vw_employee_snapshot

---

# Star Schema

```
                     dim_date
                        │
                        │
                        ▼

dim_employee ─────────────────────────┐
                                      │
dim_hotel ────────────────────────────┤
                                      │
dim_department ───────────────────────┤
                                      │
dim_contract ─────────────────────────┤
                                      │
dim_status ───────────────────────────┤
                                      │
dim_hierarchy ────────────────────────┤
                                      ▼

          fact_employee_snapshot
```

---

# Loading Strategy

The loading process follows two stages.

## Stage 1 – Python ETL

Python performs:

- Data extraction
- Validation
- Transformation
- Silver dataset generation
- Load into PostgreSQL staging

---

## Stage 2 – SQL

SQL scripts populate the analytical model.

Implemented layers:

- DDL
- DML
- Validation
- Analytics

---

# Data Warehouse Workflow

```
RAW

↓

Validation

↓

Transformation

↓

Silver

↓

PostgreSQL Staging

↓

Dimension Tables

↓

Fact Table

↓

Analytical View

↓

Power BI
```

---

# Data Integrity

The Data Warehouse enforces relational consistency through:

- Primary Keys
- Foreign Keys
- Unique Constraints
- Business Keys
- Referential Integrity

These mechanisms guarantee reliable analytical reporting.

---

# Performance

The analytical model has been optimized through:

- Star Schema
- Surrogate Keys
- Indexed Business Keys
- Dimension Separation
- Analytical Views

This structure improves SQL query performance and Power BI connectivity.

---

# SQL Layer

The SQL project is organized into four modules.

```
sql/

├── ddl/

├── dml/

├── validation/

└── analytics/
```

### DDL

Creates database objects.

### DML

Loads the Data Warehouse.

### Validation

Executes quality verification.

### Analytics

Provides reusable business queries.

---

# Current Implementation

| Component | Status |
|-----------|--------|
| PostgreSQL Database | ✅ |
| Staging Schema | ✅ |
| Data Warehouse Schema | ✅ |
| Star Schema | ✅ |
| Dimension Tables | ✅ |
| Fact Table | ✅ |
| Analytical View | ✅ |
| SQL Validation | ✅ |
| SQL Analytics | ✅ |

---

# Future Expansion

The current architecture has been designed to support additional HR domains.

Future versions will incorporate:

- Payroll
- Recruiting
- Training
- Time Tracking
- ESG Indicators

without requiring structural redesign of the Data Warehouse.

---

# Conclusion

The PostgreSQL implementation provides a scalable and maintainable analytical platform following modern Data Engineering best practices.

The current architecture supports reliable HR reporting and serves as the foundation for executive dashboards in Power BI.

---

# Author

**Fernando Raúl Robles**

Data Analytics & Data Engineering Portfolio Project

2026