# GlobalStay Hotels - Data Warehouse Design

## Architecture Overview

The project follows a modern analytical architecture:

Source Systems

↓

ETL / ELT

↓

Data Warehouse

↓

Power BI

---

# Source Systems

* HR Core
* Payroll
* Time Tracking
* Recruiting
* Training LMS
* ESG Compliance

---

# Data Warehouse Model

The analytical model follows a Star Schema approach.

---

# Dimension Tables

## dim_employee

Employee master data.

## dim_hotel

Hotel information.

## dim_country

Country information.

## dim_department

Department information.

## dim_date

Calendar dimension.

## dim_contract

Contract dimension.

---

# Fact Tables

## fact_employee_snapshot

Monthly workforce snapshot.

## fact_payroll

Payroll transactions.

## fact_absenteeism

Employee absences.

## fact_recruiting

Recruitment activities.

## fact_training

Training records.

## fact_turns

Shift information.

---

# Relationships

## One-to-Many Relationships

dim_employee → fact tables

dim_hotel → fact tables

dim_department → fact tables

dim_date → fact tables

dim_contract → fact_employee_snapshot

---

# Main KPIs Supported

## Workforce

* Headcount
* FTE
* Tenure

## Attrition

* Turnover Rate
* Voluntary Attrition
* Involuntary Attrition

## Payroll

* Payroll Cost
* Overtime Cost

## Recruiting

* Time to Hire
* Cost per Hire

## ESG

* Diversity
* Training Hours
* Workplace Accidents

---

# Benefits of Star Schema

* Faster queries
* Better Power BI performance
* Easier maintenance
* Simpler DAX calculations
* Scalable analytical architecture
