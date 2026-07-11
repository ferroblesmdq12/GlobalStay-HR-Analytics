# GlobalStay Hotels – Data Quality Report

## Overview

This report summarizes the data quality assessment performed on the HR Core dataset before loading data into the PostgreSQL Data Warehouse.

The objective is to identify, document, and resolve data quality issues while preserving business transparency through quality flags.

---

# ETL Data Flow

```
RAW Dataset
    │
    ▼
Data Validation
    │
    ▼
Data Transformation
    │
    ▼
Silver Layer
    │
    ▼
PostgreSQL Staging
    │
    ▼
Enterprise Data Warehouse
```

---

# Dataset Summary

| Metric | Value |
|---------|------:|
| RAW Records | 2,715 |
| Silver Records | 2,700 |
| Duplicate Records Removed | 15 |

---

# Validation Rules

The following validation rules are executed during the ETL process.

| Validation | Result |
|------------|--------|
| Duplicate Employee IDs | ✅ |
| Invalid Gender Values | ✅ |
| Invalid Hotel Codes | ✅ |
| Future Hire Dates | ✅ |
| Future Termination Dates | ✅ |
| Termination Before Hire | ✅ |
| Active Employee with Termination Date | ✅ |
| Minimum Working Age | ⚠ Quality Flag |
| Inactive Employee Without Termination Date | ⚠ Quality Flag |

---

# Data Cleansing Actions

The ETL process automatically performs the following transformations:

- Duplicate employee records removed.
- Gender values standardized.
- Hotel codes normalized.
- Invalid data formats corrected.
- Business rules validated.
- Quality flags generated when required.

---

# Quality Flags

Some records are intentionally preserved to simulate real business scenarios.

Current quality indicators include:

| Flag | Purpose |
|------|---------|
| invalid_birth_date_flag | Future birth date detected |
| inactive_without_termination_flag | Missing termination date |
| quality_issue_flag | General quality indicator |

These flags allow analysts to identify data quality issues without deleting historical information.

---

# Data Quality Results

The final ETL execution produced the following results:

| Result | Status |
|---------|--------|
| Data Validation | ✅ Successful |
| Data Transformation | ✅ Successful |
| Silver Layer | ✅ Generated |
| PostgreSQL Load | ✅ Successful |
| Data Warehouse Load | ✅ Successful |

---

# Business Impact

The implemented validation framework improves data reliability by:

- Detecting inconsistent records.
- Preserving business traceability.
- Supporting governance policies.
- Increasing confidence in analytical reports.

---

# Conclusion

The HR Core dataset meets the quality requirements established for the current version of the project.

All critical validation rules passed successfully, while non-critical issues are monitored through quality flags for analytical transparency.

---

# Author

**Fernando Raúl Robles**

Data Analytics & Data Engineering Portfolio Project

2026