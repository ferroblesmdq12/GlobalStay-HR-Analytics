# GlobalStay Hotels – Data Warehouse Design

## Project Overview

GlobalStay Hotels is an end-to-end HR Analytics and Data Engineering project that simulates the analytical platform of an international hotel chain.

The objective is to centralize Human Resources information from multiple operational systems into a corporate Data Warehouse designed for Business Intelligence, reporting, and strategic decision-making.

The solution follows modern Data Engineering practices, including data quality validation, data governance, dimensional modeling, ETL automation, and analytical reporting.

---

# Project Scope

The current implementation focuses on the Human Resources domain, integrating employee master data into a centralized analytical repository.

Implemented scope includes:

- HR Core
- Data Quality Assessment
- ETL Pipeline
- PostgreSQL Data Warehouse
- SQL Analytics

Future iterations will expand the platform by incorporating additional HR domains, including Payroll, Recruiting, Time Tracking, Learning Management, and ESG metrics.

# Architecture Overview

The project follows a modern layered analytical architecture.

"""
Operational Systems
(HR Core, Payroll, Recruiting...)

            │
            ▼
RAW Layer (CSV Files)

            │
            ▼
Python ETL Pipeline

            │
            ▼
Silver Layer
(Clean & Validated Data)

            │
            ▼
PostgreSQL Staging

            │
            ▼
Enterprise Data Warehouse
(Star Schema)

            │
            ▼
Analytical Views

            │
            ▼
SQL Analytics

            │
            ▼
Power BI Dashboard

---

# Source Systems

The platform has been designed to integrate information from several Human Resources domains.

| Source System | Description | Status |
|--------------|-------------|--------|
| HR Core | Employee master data | ✅ Implemented |
| Payroll | Salary and compensation | ⏳ Planned |
| Time Tracking | Attendance and shifts | ⏳ Planned |
| Recruiting | Recruitment process | ⏳ Planned |
| Training LMS | Employee training | ⏳ Planned |
| ESG Compliance | Diversity & sustainability | ⏳ Planned |

---

# Data Warehouse Methodology

The analytical repository follows the **Kimball Dimensional Modeling Methodology** using a **Star Schema** optimized for analytical workloads.

Main principles:

- Surrogate Keys
- Business Keys
- Conformed Dimensions
- Fact Tables
- Slowly Changing Dimensions (future implementation)
- Snapshot-based analytics

---

# Implemented Components

The current version of the project includes:

- Synthetic Data Generator
- Data Quality Framework
- ETL Pipeline
- Silver Layer
- PostgreSQL Staging
- Enterprise Data Warehouse
- Star Schema
- SQL Validation Layer
- SQL Analytics Layer
- Analytical Views

The platform currently manages a synthetic HR dataset composed of:

- 4 Countries
- 9 Hotels
- 10 Departments
- 2,700 Employees

# Implemented Data Warehouse

## Dimension Tables

| Dimension | Description | Status |
|-----------|-------------|--------|
| dim_employee | Employee master data | ✅ |
| dim_hotel | Hotel information | ✅ |
| dim_department | Organizational departments | ✅ |
| dim_contract | Employment contracts | ✅ |
| dim_status | Employment status | ✅ |
| dim_hierarchy | Organizational hierarchy | ✅ |
| dim_date | Calendar dimension | ✅ |

---

## Fact Tables

| Fact Table | Description | Status |
|------------|-------------|--------|
| fact_employee_snapshot | Workforce snapshot (10-Jun-2026) | ✅ |

---

# Planned Fact Tables

The following analytical fact tables are part of the project roadmap.

| Fact Table | Description |
|------------|-------------|
| fact_payroll | Payroll transactions |
| fact_absenteeism | Employee absences |
| fact_recruiting | Recruitment process |
| fact_training | Employee training |
| fact_turns | Shift scheduling |
| fact_esg | ESG indicators |

---

# Relationships

The Data Warehouse follows a classic Star Schema.

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

# Business Keys

Every dimension contains a Business Key used to uniquely identify business entities.

| Dimension | Business Key |
|-----------|--------------|
| dim_employee | employee_id |
| dim_hotel | hotel_code |
| dim_department | department_code |
| dim_contract | contract_type |
| dim_status | status_name |
| dim_hierarchy | hierarchy_level |
| dim_date | full_date |

---

# Analytical KPIs

## Currently Implemented

### Workforce

- Headcount
- Active Employees
- Employees by Hotel
- Employees by Country
- Employees by Department
- Employees by Contract Type
- Employees by Hierarchy
- Gender Distribution
- Average Employee Tenure

---

### Data Quality

- Invalid Birth Dates
- Missing Termination Dates
- Data Quality Flags

---

## Planned KPIs

### Workforce

- Full Time Equivalent (FTE)

### Attrition

- Turnover Rate
- Voluntary Attrition
- Involuntary Attrition

### Payroll

- Payroll Cost
- Overtime Cost
- Cost per Employee

### Recruiting

- Time to Hire
- Cost per Hire
- Recruitment Funnel

### Learning

- Training Hours
- Training Completion Rate

### ESG

- Diversity Indicators
- Gender Equality
- Workplace Accidents

---

# SQL Analytics Layer

The project includes a dedicated SQL Analytics layer composed of reusable business queries.

Implemented analytical reports include:

- Executive Summary
- Headcount by Hotel
- Headcount by Country
- Headcount by Department
- Contract Distribution
- Gender Distribution
- Average Tenure
- Active vs Inactive Employees
- Hierarchy Distribution
- Data Quality Summary
- Workforce Composition
- Employee Detail Dataset

These queries provide the data foundation for the Power BI executive dashboard.

---

# Data Governance

The project follows Data Governance principles.

Implemented practices include:

- Data Quality Validation
- Business Rules Validation
- Duplicate Detection
- Master Data Consistency
- Business Approval Simulation
- Quality Flags Preservation
- Data Lineage Documentation

---

# Technology Stack

## Data Engineering

- Python
- Pandas
- NumPy
- SQLAlchemy

## Database

- PostgreSQL 14
- pgAdmin 4

## Development

- Git
- GitHub
- Visual Studio Code

## Data Quality

- Business Rules Validation
- Quality Flags
- Data Governance

## Business Intelligence

- SQL Analytics
- Power BI

---

# Project Layers

```
GlobalStay Hotels

data/
│
├── raw/
├── silver/

etl/
│
├── extract.py
├── validation.py
├── transform.py
├── pipeline.py
└── postgres/

sql/
│
├── ddl/
├── dml/
├── validation/
└── analytics/

docs/

reports/

dashboards/
```

---

# Current Project Status

| Layer              | Status            |
|--------------------|-------------------|
| Synthetic Data     |   ✅             |
| Data Quality       |   ✅             |
| ETL Pipeline       |   ✅             |
| Silver Layer       |   ✅             |             
| PostgreSQL Staging |   ✅             |
| Data Warehouse     |   ✅             |
| SQL Validation     |   ✅             |
| SQL Analytics      |   ✅             |
| Power BI           |   🚧 In Progress |
---

# Project Roadmap

### Version 0.1

- Synthetic Data Generation

### Version 0.2

- ETL Pipeline

### Version 0.3

- Data Quality

### Version 0.4

- Data Governance

### Version 0.5

- PostgreSQL Data Warehouse

### Version 0.6

- Business Analytics

### Version 1.0

- Executive Power BI Dashboard

---

# Author

**Fernando Raúl Robles**

Data Analytics & Data Engineering Portfolio Project

2026