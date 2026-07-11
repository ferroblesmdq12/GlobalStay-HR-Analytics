# GlobalStay Hotels – Data Governance Policy

## Overview

This document defines the data governance principles applied to the GlobalStay Hotels HR Analytics Platform.

The objective is to ensure data consistency, quality, traceability, and reliability throughout the analytical lifecycle.

---

# Governance Objectives

The current implementation focuses on:

- Improving data quality.
- Preserving business consistency.
- Ensuring analytical reliability.
- Supporting decision-making.
- Maintaining data traceability.

---

# Governance Components

The project currently includes the following governance components:

| Component | Status |
|-----------|--------|
| Data Validation | ✅ |
| Business Rules | ✅ |
| Data Quality Report | ✅ |
| Quality Flags | ✅ |
| Change Log | ✅ |
| Business Approval | ✅ |

---

# Data Quality

The ETL pipeline validates incoming data before loading it into the Data Warehouse.

Implemented validations include:

- Duplicate Employee IDs
- Invalid Gender Values
- Invalid Hotel Codes
- Future Hire Dates
- Future Birth Dates
- Future Termination Dates
- Termination Before Hire
- Active Employees with Termination Date
- Minimum Working Age

Records containing non-critical issues are preserved using quality flags.

---

# Business Rules

The following business rules are enforced during the ETL process:

- Employee IDs must be unique.
- Hotel codes must exist in the master data.
- Hire dates cannot be in the future.
- Termination dates cannot precede hire dates.
- Active employees cannot have a termination date.
- Employees must meet the minimum working age requirement.

---

# Quality Flags

The project preserves certain business inconsistencies through quality indicators instead of deleting records.

Current flags include:

| Flag | Description |
|------|-------------|
| invalid_birth_date_flag | Future birth date detected |
| inactive_without_termination_flag | Missing termination date |
| quality_issue_flag | General quality issue indicator |

---

# Data Lineage

The analytical data follows the process below:

```
HR Core

↓

RAW Dataset

↓

Validation

↓

Transformation

↓

Silver Layer

↓

PostgreSQL Staging

↓

Data Warehouse

↓

SQL Analytics

↓

Power BI
```

---

# Responsibilities

| Role | Responsibility |
|------|----------------|
| HR Department | Owns operational employee data |
| Data Engineer | Develops and maintains ETL processes |
| Data Analyst | Builds reports and dashboards |
| Business Users | Consume analytical information |

---

# Current Governance Status

| Area | Status |
|------|--------|
| Data Quality | ✅ |
| Validation Rules | ✅ |
| Data Lineage | ✅ |
| Traceability | ✅ |
| Documentation | ✅ |

---

# Conclusion

The current governance framework provides a reliable foundation for the HR Analytics platform.

Future versions of the project will expand governance capabilities by incorporating additional HR domains, audit tables, and automated monitoring processes.

---

# Author

**Fernando Raúl Robles**

Data Analytics & Data Engineering Portfolio Project

2026