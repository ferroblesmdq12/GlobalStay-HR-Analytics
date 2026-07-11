# GlobalStay Hotels – Project Roadmap

## Project Version

**Current Version:** v0.5 – PostgreSQL Data Warehouse & SQL Analytics

---

# Project Vision

GlobalStay Hotels is an end-to-end HR Analytics and Data Engineering project that simulates the analytical platform of an international hotel chain.

The project follows a modern data architecture, covering the complete analytical lifecycle:

- Synthetic Data Generation
- Data Quality Assessment
- Data Governance
- ETL Pipeline Development
- PostgreSQL Data Warehouse
- SQL Analytics
- Business Intelligence
- Executive Dashboards

The final objective is to build a production-style portfolio project that demonstrates Data Engineering and Data Analytics best practices.

---

# Current Architecture

```
Operational Systems
        │
        ▼
RAW Layer (CSV)
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
SQL Analytics
        │
        ▼
Power BI Dashboard
```

---

# Sprint Status

| Sprint | Description | Status |
|---------|-------------|--------|
| Sprint 1 | Project Design & Synthetic Data Generation | ✅ Completed |
| Sprint 2 | Data Understanding & Data Quality | ✅ Completed |
| Sprint 3 | ETL Pipeline Development | ✅ Completed |
| Sprint 4 | PostgreSQL Data Warehouse & SQL Analytics | ✅ Completed |
| Sprint 5 | Power BI Executive Dashboard | 🚧 In Progress |
| Sprint 6 | Advanced Data Engineering Features | ⏳ Planned |

---

# Sprint 1

## Project Design & Synthetic Data Generation

### Objectives

- Define the business case.
- Design the HR analytical model.
- Design the dimensional model.
- Create the GitHub repository.
- Build the synthetic data generator.

### Deliverables

- Business Case
- HR Model
- Data Warehouse Design
- Data Dictionary
- GitHub Repository
- Project Structure
- Synthetic Data Generator
- `hr_core_employees.csv`

**Status**

✅ Completed

---

# Sprint 2

## Data Understanding & Data Quality

### Objectives

- Explore the HR Core dataset.
- Assess data quality.
- Identify business rule violations.
- Produce technical documentation.

### Deliverables

- Exploratory Data Analysis
- Data Quality Assessment
- Validation Rules
- Data Quality Report
- Business Approval
- Change Log
- Data Governance Policy

**Status**

✅ Completed

---

# Sprint 3

## ETL Pipeline Development

### Objectives

Develop a modular ETL pipeline to process HR Core data before loading the analytical repository.

### Components

- Extract
- Validation
- Transformation
- Silver Layer
- Logging
- Quality Flags

### Deliverables

- Python ETL Pipeline
- Validation Framework
- Transformation Layer
- Silver Dataset
- Data Governance Integration

**Status**

✅ Completed

---

# Sprint 4

## PostgreSQL Data Warehouse & SQL Analytics

### Objectives

Implement an enterprise-style analytical repository using PostgreSQL and dimensional modeling.

### Deliverables

#### PostgreSQL

- Database
- Schemas
- Staging Layer
- Data Warehouse

#### Star Schema

- dim_employee
- dim_hotel
- dim_department
- dim_contract
- dim_status
- dim_hierarchy
- dim_date
- fact_employee_snapshot

#### SQL

- DDL Scripts
- DML Scripts
- Validation Queries
- Analytics Queries
- Analytical View

#### Documentation

- Data Warehouse Design
- PostgreSQL Design
- Data Dictionary
- Governance Documentation

**Status**

✅ Completed

---

# Sprint 5

## Business Intelligence

### Objectives

Develop an executive HR dashboard connected directly to PostgreSQL.

### Planned Deliverables

- PostgreSQL Connection
- Executive Dashboard
- HR KPIs
- Interactive Filters
- Executive Storytelling
- Dashboard Documentation
- Repository Screenshots
- README Update

**Status**

🚧 In Progress

---

# Sprint 6

## Advanced Data Engineering

### Objectives

Extend the platform using production-oriented engineering practices.

### Planned Features

- Incremental Loads
- Configuration Files
- Environment Variables
- Logging Framework
- Audit Tables
- Error Handling
- Scheduling
- Docker Support
- Airflow Preparation
- dbt Preparation
- Cloud Migration
- CI/CD Pipeline

**Status**

⏳ Planned

---

# Technology Stack

## Programming

- Python

## Data Processing

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

# Current Project Statistics

| Metric | Value |
|---------|------:|
| Countries | 4 |
| Hotels | 9 |
| Departments | 10 |
| Employees | 2,700 |
| Raw Records | 2,715 |
| Silver Records | 2,700 |
| Dimension Tables | 7 |
| Fact Tables | 1 |
| SQL Analytics Queries | 15 |
| Validation Scripts | 4 |

---

# Repository Structure

```
GlobalStay Hotels/
│
├── data/
│   ├── raw/
│   └── silver/
│
├── docs/
│
├── etl/
│
├── reports/
│
├── scripts/
│
├── sql/
│   ├── analytics/
│   ├── ddl/
│   ├── dml/
│   └── validation/
│
├── dashboards/
│
├── README.md
├── requirements.txt
└── .gitignore
```

---

# Project Goals

The project has been designed to demonstrate practical skills in:

- Data Engineering
- Data Analytics
- Data Quality
- Data Governance
- Dimensional Modeling
- ETL Development
- PostgreSQL
- SQL Analytics
- Business Intelligence
- Technical Documentation
- Git Version Control

---

# Long-Term Vision

Future project iterations will incorporate additional HR domains, including:

- Payroll
- Recruiting
- Training
- Time Tracking
- ESG
- Workforce Planning

This evolution will transform the current HR Analytics platform into a complete enterprise People Analytics solution.

---

# Author

**Fernando Raúl Robles**

Data Analytics & Data Engineering Portfolio Project

2026