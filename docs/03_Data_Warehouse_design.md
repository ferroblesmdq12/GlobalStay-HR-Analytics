# GlobalStay Hotels – Data Warehouse Design

## Project Overview

GlobalStay Hotels is an end-to-end HR Analytics and Data Engineering project that simulates the analytical platform of an international hotel chain.

The objective is to centralize Human Resources information from multiple operational systems into a corporate Data Warehouse designed for Business Intelligence, reporting, and strategic decision-making.

The solution follows modern Data Engineering practices, including data quality validation, data governance, dimensional modeling, ETL automation, and analytical reporting.

---

# Architecture Overview

The project follows a modern layered analytical architecture.

```
Operational Systems
        │
        ▼
     RAW Layer
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
 Analytical Views
        │
        ▼
     Power BI
```

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
dim_employee ───────┼──────── dim_hotel
                    │
                    │
         fact_employee_snapshot
                    │
      ┌─────────────┼─────────────┐
      │             │             │
dim_department dim_contract dim_status
                    │
             dim_hierarchy
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

## Analytics

- SQL
- Power BI

## Development

- Git
- GitHub
- Visual Studio Code

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
└── analytics/

docs/

reports/

dashboards/
```

---

# Current Version

| Component | Status |
|----------|--------|
| Synthetic Data Generator | ✅ |
| ETL Pipeline | ✅ |
| Data Quality Framework | ✅ |
| Data Governance | ✅ |
| PostgreSQL Staging | ✅ |
| Data Warehouse | ✅ |
| Star Schema | ✅ |
| Analytical Views | ✅ |
| Power BI Dashboard | ⏳ In Progress |

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