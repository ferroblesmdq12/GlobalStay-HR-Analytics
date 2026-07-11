# GlobalStay Hotels — HR Analytics & Data Engineering Platform

End-to-end portfolio project that simulates the analytical platform of an international hotel chain, covering synthetic data generation, data quality, ETL development, data governance, PostgreSQL dimensional modeling, SQL analytics, and Business Intelligence.

## Project Status

**Current version:** `v0.5 — PostgreSQL Data Warehouse & SQL Analytics`

| Component | Status |
|---|---|
| Synthetic Data Generator | ✅ Completed |
| Exploratory Data Analysis | ✅ Completed |
| Data Quality Framework | ✅ Completed |
| Data Governance | ✅ Completed |
| Python ETL Pipeline | ✅ Completed |
| Silver Layer | ✅ Completed |
| PostgreSQL Staging | ✅ Completed |
| Star Schema Data Warehouse | ✅ Completed |
| SQL Validation Layer | ✅ Completed |
| SQL Analytics Layer | ✅ Completed |
| Power BI Dashboard | 🚧 In progress |

---

## Project Overview

GlobalStay Hotels is a fictional multinational hotel chain with operations in:

- Spain
- Mexico
- Cuba
- Dominican Republic

The project centralizes Human Resources data into a governed analytical platform designed to support reporting, workforce analysis, data quality monitoring, and executive decision-making.

The current implementation focuses on the **HR Core** domain and manages:

| Metric | Value |
|---|---:|
| Countries | 4 |
| Hotels | 9 |
| Departments | 10 |
| Employees | 2,700 |
| RAW records | 2,715 |
| Silver records | 2,700 |
| Dimension tables | 7 |
| Fact tables | 1 |
| SQL analytics queries | 15 |
| SQL validation scripts | 4 |

Future versions will incorporate Payroll, Recruiting, Training, Time Tracking, and ESG data.

---

## Business Problem

Human Resources information is typically distributed across operational systems such as:

- HR Core
- Payroll
- Time Tracking
- Recruiting
- Training LMS
- ESG Compliance

This fragmentation can create:

- inconsistent data;
- duplicated employee records;
- weak traceability;
- manual reporting processes;
- difficulty performing audits;
- delayed business decisions.

GlobalStay Hotels addresses these issues by implementing a structured analytical architecture with automated validation, governed transformations, dimensional modeling, and reusable SQL analytics.

---

## Business Objectives

- Centralize Human Resources information.
- Improve data consistency and reliability.
- Automate validation and transformation processes.
- Build a reusable PostgreSQL Data Warehouse.
- Provide a single analytical source for Power BI.
- Support workforce, tenure, diversity, contract, hierarchy, and data quality analysis.
- Establish traceability through Data Governance documentation.

---

## Architecture

```text
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
SQL Analytics
        │
        ▼
Power BI Dashboard
```

### Layer Responsibilities

| Layer | Responsibility |
|---|---|
| RAW | Stores source-like synthetic data with intentional quality issues. |
| ETL | Extracts, validates, transforms, and prepares HR Core data. |
| Silver | Stores cleaned and standardized employee data. |
| Staging | Loads the Silver dataset into PostgreSQL before dimensional processing. |
| Data Warehouse | Stores dimensions and facts using a Star Schema. |
| Analytical Views | Simplifies consumption by BI tools and SQL users. |
| SQL Analytics | Provides reusable business queries and KPI datasets. |
| Power BI | Presents executive HR dashboards and interactive analysis. |

---

## Technology Stack

### Programming and Data Processing

- Python 3
- Pandas
- NumPy
- SQLAlchemy
- psycopg2
- python-dotenv

### Database

- PostgreSQL 14
- pgAdmin 4

### Analytics and BI

- SQL
- Power BI

### Development and Version Control

- Visual Studio Code
- Git
- GitHub

---

## Repository Structure

```text
GlobalStay Hotels/
│
├── data/
│   ├── raw/
│   └── silver/
│
├── docs/
│   ├── diagrams/
│   ├── images/
│   ├── 01_Business_Case.md
│   ├── 02_HR_Model.md
│   ├── 03_Data_Warehouse_Design.md
│   ├── 04_Data_Dictionary.md
│   ├── 05_Data_Quality_Report.md
│   ├── 06_Business_Approval.md
│   ├── 07_Change_Log.md
│   ├── 08_Data_Governance_Policy.md
│   ├── 09_Data_Warehouse_PostgreSQL_Design.md
│   └── PROJECT_ROADMAP.md
│
├── etl/
│   ├── extract.py
│   ├── validation.py
│   ├── transform.py
│   ├── load.py
│   ├── pipeline.py
│   └── postgres/
│       ├── __init__.py
│       ├── connection.py
│       └── staging_loader.py
│
├── notebooks/
│   └── 01_EDA_HR_Core.ipynb
│
├── reports/
│   └── sprint_02/
│
├── scripts/
│   └── generate_raw_data.py
│
├── sql/
│   ├── ddl/
│   │   ├── 01_create_database.sql
│   │   ├── 02_create_schemas.sql
│   │   ├── 03_create_staging.sql
│   │   ├── 04_create_dimensions.sql
│   │   ├── 05_create_fact_tables.sql
│   │   ├── 06_constraints.sql
│   │   ├── 07_indexes.sql
│   │   └── 08_views.sql
│   │
│   ├── dml/
│   │   ├── 01_load_dim_hotel.sql
│   │   ├── 02_load_dim_department.sql
│   │   ├── 03_load_dim_contract.sql
│   │   ├── 04_load_dim_status.sql
│   │   ├── 05_load_dim_hierarchy.sql
│   │   ├── 06_load_dim_employee.sql
│   │   ├── 07_load_dim_date.sql
│   │   └── 08_load_fact_employee_snapshot.sql
│   │
│   ├── validation/
│   │   ├── 01_validate_dimensions.sql
│   │   ├── 02_validate_fact.sql
│   │   ├── 03_validate_relationships.sql
│   │   └── 04_validate_business_rules.sql
│   │
│   └── analytics/
│       ├── 01_executive_summary.sql
│       ├── 02_headcount_by_hotel.sql
│       ├── 03_headcount_by_country.sql
│       ├── 04_headcount_by_department.sql
│       ├── 05_contract_distribution.sql
│       ├── 06_gender_distribution.sql
│       ├── 07_average_tenure.sql
│       ├── 08_active_vs_inactive.sql
│       ├── 09_hierarchy_distribution.sql
│       ├── 10_data_quality_summary.sql
│       ├── 11_status_distribution.sql
│       ├── 12_tenure_by_department.sql
│       ├── 13_quality_issues_by_hotel.sql
│       ├── 14_workforce_composition.sql
│       └── 15_employee_detail_dataset.sql
│
├── dashboards/
│
├── .env
├── .gitignore
├── requirements.txt
└── README.md
```

---

## Synthetic Data Generation

The project generates a realistic HR Core dataset for 2,700 employees distributed across 9 hotels.

The generator preserves Master Data relationships between:

- `hotel_code`
- `hotel_name`
- `city`
- `country`

It also introduces controlled RAW data quality issues to simulate real-world operational problems:

| Issue | Records |
|---|---:|
| Duplicate employee IDs | 15 |
| Inconsistent gender values | 20 |
| Invalid hotel codes | 10 |
| Future birth dates | 5 |
| Inactive employees without termination date | 38 |

The RAW file contains 2,715 rows because the dataset intentionally includes 15 duplicates.

---

## ETL Pipeline

The Python ETL pipeline follows a modular design:

```text
Extract
  ↓
Validate
  ↓
Transform
  ↓
Load Silver
  ↓
Load PostgreSQL Staging
```

### Main Modules

| Module | Responsibility |
|---|---|
| `extract.py` | Reads the RAW HR Core dataset. |
| `validation.py` | Executes data quality and business rule checks. |
| `transform.py` | Standardizes, cleans, derives fields, and creates quality flags. |
| `load.py` | Saves the cleaned Silver dataset. |
| `pipeline.py` | Orchestrates the full ETL flow. |
| `postgres/connection.py` | Creates the SQLAlchemy PostgreSQL connection. |
| `postgres/staging_loader.py` | Loads Silver data into PostgreSQL staging. |

### Pipeline Results

```text
RAW Records:     2715
Silver Records:  2700
Pipeline Status: SUCCESS
```

### Transformations Applied

- Removal of duplicate employee IDs.
- Standardization of gender values.
- Reconciliation of invalid hotel codes.
- Date conversion and validation.
- Age calculation in the Silver layer.
- Creation of `invalid_birth_date_flag`.
- Creation of `inactive_without_termination_flag`.

---

## Data Quality

The project validates data both before and after transformation.

### Validation Framework

- Duplicate employee IDs
- Gender value validity
- Hotel code validity
- Future birth dates
- Future hire dates
- Future termination dates
- Termination before hire date
- Active employees with termination date
- Inactive employees without termination date
- Minimum working age

### Before and After ETL

| Validation | RAW | Silver |
|---|---:|---:|
| Duplicate employee IDs | 15 | 0 |
| Invalid gender values | 20 | 0 |
| Invalid hotel codes | 10 | 0 |
| Future birth dates | 5 | 5 |
| Inactive without termination date | 38 | 38 |
| Employees under 18 | 5 | 5 |

Some issues remain intentionally because they cannot be safely corrected without evidence from the business. Those records are preserved and identified with quality flags.

---

## Data Governance

The project includes a simulated corporate Data Governance process.

### Roles

| Role | Area | Responsibility |
|---|---|---|
| Data Owner | Corporate Human Resources | Approves business rules and data corrections. |
| Data Steward | HR Data Manager | Reviews quality incidents and maintains business catalogs. |
| Data Custodian | Data Engineering | Implements approved changes and maintains the platform. |
| Data Consumer | BI, HR, Finance, Management | Uses governed data for analysis and decisions. |

### Governance Flow

```text
Issue Detection
      ↓
Data Quality Report
      ↓
Data Steward Review
      ↓
Data Owner Approval
      ↓
ETL Implementation
      ↓
Change Log
      ↓
Data Warehouse Load
```

### Approved Actions

- Remove approved duplicate records.
- Standardize categorical values.
- Reconcile Master Data codes.
- Preserve uncertain personal data without fabrication.
- Generate quality flags for unresolved incidents.

---

## PostgreSQL Data Warehouse

The analytical repository uses two PostgreSQL schemas:

```text
globalstay_dw
├── staging
└── dw
```

### `staging` Schema

Stores the cleaned Silver dataset before dimensional loading.

Main table:

- `staging.hr_core_employees`

### `dw` Schema

Contains the analytical Star Schema.

#### Dimensions

- `dw.dim_employee`
- `dw.dim_hotel`
- `dw.dim_department`
- `dw.dim_contract`
- `dw.dim_status`
- `dw.dim_hierarchy`
- `dw.dim_date`

#### Fact Table

- `dw.fact_employee_snapshot`

#### Analytical View

- `dw.vw_employee_snapshot`

---

## Dimensional Model

### Fact Grain

Each row in `fact_employee_snapshot` represents:

> One employee at one snapshot date.

Current snapshot date:

```text
2026-06-10
```

### Star Schema

```text
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

### Fact Measures and Indicators

- `is_active`
- `tenure_months`
- `quality_issue_flag`

### Surrogate Keys

Each dimension uses a technical surrogate key independent from the operational business key.

Examples:

| Dimension | Surrogate Key | Business Key |
|---|---|---|
| Employee | `employee_key` | `employee_id` |
| Hotel | `hotel_key` | `hotel_code` |
| Department | `department_key` | `department_code` |
| Contract | `contract_key` | `contract_type` |
| Status | `status_key` | `status_name` |
| Hierarchy | `hierarchy_key` | `hierarchy_level` |
| Date | `date_key` | `full_date` |

---

## SQL Organization

The SQL code is divided by responsibility.

### DDL

Creates database objects:

- database;
- schemas;
- staging tables;
- dimensions;
- fact tables;
- constraints;
- indexes;
- views.

### DML

Loads the dimensional model:

- hotel dimension;
- department dimension;
- contract dimension;
- status dimension;
- hierarchy dimension;
- employee dimension;
- date dimension;
- employee snapshot fact.

### Validation

Verifies:

- record counts;
- uniqueness;
- referential integrity;
- orphan keys;
- non-negative tenure;
- business rule consistency.

### Analytics

Provides reusable SQL datasets for HR analysis and Power BI.

---

## SQL Analytics

The analytical layer currently includes 15 business queries.

### Executive and Workforce Analysis

- Executive summary
- Headcount by hotel
- Headcount by country
- Headcount by department
- Contract distribution
- Gender distribution
- Average tenure
- Active versus inactive employees
- Hierarchy distribution
- Status distribution

### Data Quality and Detailed Analysis

- Data quality summary
- Tenure by department
- Quality issues by hotel
- Workforce composition
- Employee detail dataset

### Business Questions Answered

- How many employees are active?
- How is headcount distributed across hotels?
- Which countries and departments have the largest workforce?
- What is the average employee tenure?
- How is the workforce distributed by contract and hierarchy?
- What is the gender distribution?
- Which hotels contain the most quality issues?
- How many employees have unresolved data quality flags?

---

## Current Analytical Results

| KPI | Result |
|---|---:|
| Total employees | 2,700 |
| Active employees | 2,365 |
| Inactive employees | 335 |
| Minimum tenure | 0 months |
| Maximum tenure | 77 months |
| Employees with quality issues | 43 |

---

## Power BI

The Power BI dashboard will connect directly to PostgreSQL using:

```text
Power BI
   ↓
PostgreSQL
   ↓
dw.vw_employee_snapshot
```

### Planned Dashboard Sections

- Executive Summary
- Headcount by Hotel
- Headcount by Country
- Department Distribution
- Contract Distribution
- Gender Diversity
- Hierarchy Distribution
- Average Tenure
- Active versus Inactive Employees
- Data Quality Monitoring

Dashboard screenshots will be added after implementation.

---

## Installation

### Prerequisites

- Python 3.11 or newer
- PostgreSQL 14 or newer
- pgAdmin 4
- Git
- Power BI Desktop

### Clone the Repository

```bash
git clone https://github.com/ferroblesmdq12/<repository-name>.git
cd "GlobalStay Hotels"
```

Replace `<repository-name>` with the final GitHub repository name.

### Create a Virtual Environment

```bash
python -m venv .venv
```

Windows:

```bash
.venv\Scripts\activate
```

Linux or macOS:

```bash
source .venv/bin/activate
```

### Install Dependencies

```bash
pip install -r requirements.txt
```

---

## Environment Variables

Create a `.env` file in the project root:

```env
DB_HOST=localhost
DB_PORT=5432
DB_NAME=globalstay_dw
DB_USER=postgres
DB_PASSWORD=
```

The `.env` file must remain excluded from Git using `.gitignore`.

---

## How to Run the Project

### 1. Generate the RAW Dataset

```bash
python scripts/generate_raw_data.py
```

Expected result:

```text
Archivo generado: data/raw/hr_core_employees.csv
Registros generados: 2715
```

### 2. Run the Python ETL Pipeline

```bash
python -m etl.pipeline
```

Expected result:

```text
RAW Records: 2715
Silver Records: 2700
Estado Pipeline: SUCCESS
```

### 3. Create PostgreSQL Objects

Execute the scripts in `sql/ddl/` in numerical order.

Important:

- Run `01_create_database.sql` while connected to the default `postgres` database.
- Run the remaining scripts while connected to `globalstay_dw`.

### 4. Load Silver Data into Staging

```bash
python -m etl.postgres.staging_loader
```

Expected result:

```text
Registros cargados en staging.hr_core_employees: 2700
```

### 5. Load Dimensions and Fact Table

Execute the scripts in `sql/dml/` in numerical order.

### 6. Validate the Data Warehouse

Execute all scripts in:

```text
sql/validation/
```

Expected results include:

- 2,700 fact rows;
- 2,700 unique employees;
- zero orphan foreign keys;
- zero negative tenure values.

### 7. Run Analytical Queries

Execute the scripts in:

```text
sql/analytics/
```

### 8. Connect Power BI

Use the PostgreSQL connector and select:

```text
dw.vw_employee_snapshot
```

---

## Documentation

| Document | Purpose |
|---|---|
| `01_Business_Case.md` | Business context, stakeholders, and objectives. |
| `02_HR_Model.md` | HR domain model and workforce structure. |
| `03_Data_Warehouse_Design.md` | Conceptual analytical architecture. |
| `04_Data_Dictionary.md` | Implemented tables, fields, keys, and rules. |
| `05_Data_Quality_Report.md` | Data quality findings and ETL results. |
| `06_Business_Approval.md` | Approved business decisions for corrections. |
| `07_Change_Log.md` | Traceability of implemented changes. |
| `08_Data_Governance_Policy.md` | Governance roles, principles, and controls. |
| `09_Data_Warehouse_PostgreSQL_Design.md` | Technical PostgreSQL implementation. |
| `PROJECT_ROADMAP.md` | Sprint status and future development. |

---

## Project Roadmap

### v0.1 — Project Design

- Business Case
- HR Model
- Initial repository structure

### v0.2 — Synthetic Data

- HR Core generator
- RAW data layer

### v0.3 — Data Quality

- EDA
- Validation framework
- Data Quality Report

### v0.4 — ETL and Data Governance

- Modular Python ETL
- Silver layer
- Business Approval
- Change Log
- Governance Policy

### v0.5 — PostgreSQL Data Warehouse

- Staging schema
- Star Schema
- Dimensions and fact table
- SQL validation
- SQL analytics

### v1.0 — Power BI Executive Dashboard

- Executive KPI dashboard
- Interactive filters
- Business storytelling
- Final documentation
- Portfolio release

### Future Engineering Extensions

- Incremental loads
- Slowly Changing Dimensions
- Audit tables
- Automated tests
- Docker
- Airflow
- dbt
- Cloud deployment
- CI/CD
- Monitoring and alerting

---

## Current Limitations

- The current implementation contains one workforce snapshot dated 10 June 2026.
- Historical monthly headcount evolution is not yet available.
- Turnover Rate cannot yet be calculated rigorously across multiple periods.
- Payroll, Recruiting, Training, Time Tracking, and ESG sources are planned but not yet implemented.
- Slowly Changing Dimensions are planned for a future version.

These limitations are explicitly documented to distinguish implemented functionality from the future roadmap.

---

## Key Learning Outcomes

This project demonstrates practical experience with:

- end-to-end analytical architecture;
- synthetic data generation;
- Python ETL development;
- data validation and quality flags;
- data governance and business approval;
- PostgreSQL administration;
- staging design;
- dimensional modeling;
- surrogate and business keys;
- DDL and DML organization;
- referential integrity;
- SQL analytics;
- Power BI preparation;
- Git and GitHub version control;
- technical documentation.

---

## Author

**Fernando Raúl Robles**

Data Analytics & Data Engineering Portfolio Project

GitHub: [ferroblesmdq12](https://github.com/ferroblesmdq12)

---

## License

This project was created for educational and portfolio purposes. All data is synthetic and does not represent real employees or real business operations.
