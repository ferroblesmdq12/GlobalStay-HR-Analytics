# GlobalStay Hotels - Data Dictionary

## Overview

This document describes all tables, columns, business rules and data quality validations used in the GlobalStay Hotels HR Analytics Data Warehouse.

---

# Dimension Tables

---

# dim_employee

Employee master information.

## Primary Key

employee_key

## Columns

| Column           | Data Type    | Key | Description                  |
| ---------------- | ------------ | --- | ---------------------------- |
| employee_key     | INT          | PK  | Surrogate key                |
| employee_id      | VARCHAR(20)  | NK  | Employee business identifier |
| full_name        | VARCHAR(150) |     | Employee full name           |
| gender           | VARCHAR(20)  |     | Gender                       |
| birth_date       | DATE         |     | Birth date                   |
| hire_date        | DATE         |     | Hiring date                  |
| termination_date | DATE         |     | Termination date             |
| employee_status  | VARCHAR(50)  |     | Employment status            |
| hierarchy_level  | VARCHAR(50)  |     | Hierarchy level              |
| hotel_key        | INT          | FK  | Assigned hotel               |
| department_key   | INT          | FK  | Assigned department          |
| contract_key     | INT          | FK  | Assigned contract type       |

## Business Rules

* Employee ID must be unique.
* Hire date must be before termination date.
* Employee age must be greater than or equal to 18.
* Employee status must be valid.

---

# dim_hotel

Hotel master information.

## Primary Key

hotel_key

## Columns

| Column       | Data Type    | Key | Description               |
| ------------ | ------------ | --- | ------------------------- |
| hotel_key    | INT          | PK  | Surrogate key             |
| hotel_id     | VARCHAR(20)  | NK  | Business hotel identifier |
| hotel_name   | VARCHAR(150) |     | Hotel name                |
| country_key  | INT          | FK  | Country identifier        |
| city         | VARCHAR(100) |     | City                      |
| hotel_type   | VARCHAR(50)  |     | Resort, Business or Beach |
| opening_date | DATE         |     | Opening date              |

## Business Rules

* Hotel ID must be unique.
* Country must exist.
* Hotel type must be valid.

---

# dim_country

Country information.

## Primary Key

country_key

## Columns

| Column       | Data Type    | Key | Description       |
| ------------ | ------------ | --- | ----------------- |
| country_key  | INT          | PK  | Surrogate key     |
| country_name | VARCHAR(100) |     | Country name      |
| region       | VARCHAR(100) |     | Geographic region |
| currency     | VARCHAR(10)  |     | Currency          |

## Expected Values

| Country            | Region        | Currency |
| ------------------ | ------------- | -------- |
| Spain              | Europe        | EUR      |
| Mexico             | North America | MXN      |
| Cuba               | Caribbean     | CUP      |
| Dominican Republic | Caribbean     | DOP      |

---

# dim_department

Department information.

## Primary Key

department_key

## Columns

| Column           | Data Type    | Key | Description                   |
| ---------------- | ------------ | --- | ----------------------------- |
| department_key   | INT          | PK  | Surrogate key                 |
| department_code  | VARCHAR(10)  | NK  | Department code               |
| department_name  | VARCHAR(100) |     | Department name               |
| department_group | VARCHAR(50)  |     | Operational or Administrative |

## Department List

| Code | Department             |
| ---- | ---------------------- |
| FD   | Front Desk             |
| HK   | Housekeeping           |
| FB   | Food & Beverage        |
| MT   | Maintenance            |
| HR   | Human Resources        |
| FN   | Finance                |
| SM   | Sales & Marketing      |
| IT   | Information Technology |
| SC   | Security               |
| SW   | Spa & Wellness         |

---

# dim_date

Calendar dimension.

## Primary Key

date_key

## Columns

| Column      | Data Type   | Key | Description       |
| ----------- | ----------- | --- | ----------------- |
| date_key    | INT         | PK  | YYYYMMDD format   |
| full_date   | DATE        |     | Full date         |
| year        | INT         |     | Year              |
| quarter     | INT         |     | Quarter           |
| month       | INT         |     | Month             |
| month_name  | VARCHAR(20) |     | Month name        |
| week_number | INT         |     | Week number       |
| day_name    | VARCHAR(20) |     | Day name          |
| is_weekend  | BOOLEAN     |     | Weekend indicator |

---

# dim_contract

Contract information.

## Primary Key

contract_key

## Columns

| Column         | Data Type   | Key | Description                  |
| -------------- | ----------- | --- | ---------------------------- |
| contract_key   | INT         | PK  | Surrogate key                |
| contract_type  | VARCHAR(50) |     | Contract type                |
| contract_group | VARCHAR(50) |     | Permanent or Temporary       |
| is_permanent   | BOOLEAN     |     | Permanent contract indicator |

## Expected Values

* Permanent
* Temporary
* Seasonal
* Internship

---

# Fact Tables

---

# fact_employee_snapshot

Monthly workforce snapshot.

## Primary Key

snapshot_key

## Columns

| Column         | Data Type    | Key |
| -------------- | ------------ | --- |
| snapshot_key   | INT          | PK  |
| date_key       | INT          | FK  |
| employee_key   | INT          | FK  |
| hotel_key      | INT          | FK  |
| department_key | INT          | FK  |
| contract_key   | INT          | FK  |
| is_active      | BOOLEAN      |     |
| tenure_months  | INT          |     |
| fte            | DECIMAL(4,2) |     |

## Business Rules

* One record per employee per month.
* Active employees contribute to Headcount.
* FTE must be between 0 and 1.
* Tenure cannot be negative.

---

# fact_payroll

Payroll transactions.

## Primary Key

payroll_key

## Columns

| Column             | Data Type     | Key |
| ------------------ | ------------- | --- |
| payroll_key        | INT           | PK  |
| date_key           | INT           | FK  |
| employee_key       | INT           | FK  |
| hotel_key          | INT           | FK  |
| department_key     | INT           | FK  |
| base_salary        | DECIMAL(10,2) |     |
| bonus_amount       | DECIMAL(10,2) |     |
| overtime_amount    | DECIMAL(10,2) |     |
| employer_cost      | DECIMAL(10,2) |     |
| total_payroll_cost | DECIMAL(10,2) |     |

## Business Rules

* Salaries cannot be negative.
* Payroll must exist for active employees.
* Total payroll cost must be calculated correctly.

---

# fact_absenteeism

Employee absences.

## Primary Key

absenteeism_key

## Columns

| Column          | Data Type    | Key |
| --------------- | ------------ | --- |
| absenteeism_key | INT          | PK  |
| date_key        | INT          | FK  |
| employee_key    | INT          | FK  |
| hotel_key       | INT          | FK  |
| department_key  | INT          | FK  |
| absence_type    | VARCHAR(50)  |     |
| scheduled_hours | DECIMAL(4,2) |     |
| absent_hours    | DECIMAL(4,2) |     |

## Allowed Values

* Sick Leave
* Personal Leave
* Unjustified Absence
* Work Accident

## Business Rules

* Absent hours cannot exceed scheduled hours.
* Scheduled hours must be positive.

---

# fact_recruiting

Recruitment process information.

## Primary Key

recruiting_key

## Columns

| Column               | Data Type     | Key |
| -------------------- | ------------- | --- |
| recruiting_key       | INT           | PK  |
| candidate_id         | VARCHAR(20)   |     |
| application_date_key | INT           | FK  |
| hire_date_key        | INT           | FK  |
| hotel_key            | INT           | FK  |
| department_key       | INT           | FK  |
| position_name        | VARCHAR(100)  |     |
| recruitment_source   | VARCHAR(50)   |     |
| hiring_status        | VARCHAR(50)   |     |
| time_to_hire_days    | INT           |     |
| recruitment_cost     | DECIMAL(10,2) |     |

## Hiring Status Values

* Applied
* Interview
* Offer
* Hired
* Rejected
* Withdrawn

---

# fact_training

Employee training records.

## Primary Key

training_key

## Columns

| Column            | Data Type    | Key |
| ----------------- | ------------ | --- |
| training_key      | INT          | PK  |
| date_key          | INT          | FK  |
| employee_key      | INT          | FK  |
| hotel_key         | INT          | FK  |
| department_key    | INT          | FK  |
| training_name     | VARCHAR(150) |     |
| training_category | VARCHAR(100) |     |
| hours_completed   | DECIMAL(5,2) |     |
| completion_status | VARCHAR(50)  |     |

## Training Categories

* Compliance
* Customer Service
* Safety
* Leadership
* Technical Skills
* ESG

---

# fact_turns

Employee shift information.

## Primary Key

shift_key

## Columns

| Column          | Data Type    | Key |
| --------------- | ------------ | --- |
| shift_key       | INT          | PK  |
| date_key        | INT          | FK  |
| employee_key    | INT          | FK  |
| hotel_key       | INT          | FK  |
| department_key  | INT          | FK  |
| shift_type      | VARCHAR(50)  |     |
| scheduled_hours | DECIMAL(4,2) |     |
| worked_hours    | DECIMAL(4,2) |     |
| overtime_hours  | DECIMAL(4,2) |     |

## Shift Types

* Morning
* Afternoon
* Night

---

# Data Quality Rules

## Uniqueness

* employee_id must be unique.
* hotel_id must be unique.
* department_code must be unique.

## Referential Integrity

* All FK values must exist in their corresponding dimensions.

## Consistency

* Valid dates.
* Valid salaries.
* Valid contracts.
* Valid statuses.

## Completeness

Mandatory fields:

* employee_id
* hotel_key
* department_key
* date_key

## Validity

Controlled lists for:

* Countries
* Contract Types
* Employee Status
* Shift Types
* Absence Types
* Hiring Status

---

# Data Governance Notes

This project follows best practices for:

* Data Quality
* Data Governance
* Data Lineage
* Master Data Management (MDM)
* ESG Reporting
* HR Analytics
