# GlobalStay Hotels – Data Dictionary

## Overview

This document describes the current structure of the GlobalStay Hotels Data Warehouse.

The Data Warehouse follows a Star Schema architecture implemented in PostgreSQL and stores HR Core information for analytical reporting.

The current implementation includes seven dimension tables, one fact table and one analytical view.

---

# Data Warehouse Structure

## Dimension Tables

- dim_employee
- dim_hotel
- dim_department
- dim_contract
- dim_status
- dim_hierarchy
- dim_date

## Fact Table

- fact_employee_snapshot

## Analytical View

- vw_employee_snapshot

---

# Dimension Tables

## dim_employee

Employee master information.

| Column | Description |
|----------|-------------|
| employee_key | Surrogate Key |
| employee_id | Business Key |
| full_name | Employee full name |
| gender | Employee gender |
| birth_date | Employee birth date |

---

## dim_hotel

Hotel information.

| Column | Description |
|----------|-------------|
| hotel_key | Surrogate Key |
| hotel_code | Business Key |
| hotel_name | Hotel name |
| city | Hotel city |
| country | Hotel country |

---

## dim_department

Department information.

| Column | Description |
|----------|-------------|
| department_key | Surrogate Key |
| department_code | Business Key |
| department_name | Department name |

---

## dim_contract

Employee contract types.

| Column | Description |
|----------|-------------|
| contract_key | Surrogate Key |
| contract_type | Contract description |

---

## dim_status

Employee employment status.

| Column | Description |
|----------|-------------|
| status_key | Surrogate Key |
| status_name | Employee status |

---

## dim_hierarchy

Organizational hierarchy.

| Column | Description |
|----------|-------------|
| hierarchy_key | Surrogate Key |
| hierarchy_level | Organizational level |

---

## dim_date

Calendar dimension.

| Column | Description |
|----------|-------------|
| date_key | Surrogate Key |
| full_date | Calendar date |
| year | Year |
| quarter | Quarter |
| month | Month |
| month_name | Month name |

---

# Fact Table

## fact_employee_snapshot

Stores workforce information for each employee at the snapshot date.

| Column | Description |
|----------|-------------|
| snapshot_key | Surrogate Key |
| employee_key | Employee FK |
| hotel_key | Hotel FK |
| department_key | Department FK |
| contract_key | Contract FK |
| status_key | Status FK |
| hierarchy_key | Hierarchy FK |
| date_key | Snapshot Date FK |
| is_active | Active employee flag |
| tenure_months | Employee tenure |
| quality_issue_flag | Data quality indicator |

---

# Analytical View

## vw_employee_snapshot

Business view used by SQL Analytics and Power BI.

The view joins the fact table with all dimensions to simplify analytical queries and dashboard development.

---

# Data Quality Flags

The ETL process generates quality indicators during data validation.

Current flags include:

- invalid_birth_date_flag
- inactive_without_termination_flag
- quality_issue_flag

These indicators allow data quality monitoring without modifying historical records.

---

# Naming Conventions

## Primary Keys

Every table uses a surrogate key ending with:

```
_key
```

Example:

```
employee_key
```

---

## Business Keys

Business identifiers are preserved.

Examples:

```
employee_id

hotel_code

department_code
```

---

## Foreign Keys

All relationships are implemented through surrogate keys to ensure referential integrity and improve query performance.

---

# Current Data Warehouse

| Component | Quantity |
|------------|---------:|
| Countries | 4 |
| Hotels | 9 |
| Departments | 10 |
| Employees | 2,700 |
| Dimension Tables | 7 |
| Fact Tables | 1 |
| Analytical Views | 1 |

---

# Future Expansion

Future project iterations will incorporate additional HR domains, including:

- Payroll
- Recruiting
- Training
- Time Tracking
- ESG Metrics

The current dimensional model has been designed to support this future expansion while maintaining scalability and performance.

---

# Author

**Fernando Raúl Robles**

Data Analytics & Data Engineering Portfolio Project

2026