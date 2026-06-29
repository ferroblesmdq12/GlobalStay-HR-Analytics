"""
GlobalStay Hotels - HR Analytics ETL Configuration

Este módulo contiene la configuración central del pipeline ETL.
Aquí se definen rutas, fechas de referencia, catálogos oficiales
y reglas de estandarización.
"""

from pathlib import Path
import pandas as pd


# ============================================================
# PROJECT PATHS
# ============================================================

PROJECT_ROOT = Path(__file__).resolve().parents[1]

DATA_DIR = PROJECT_ROOT / "data"
RAW_DIR = DATA_DIR / "raw"
SILVER_DIR = DATA_DIR / "silver"
GOLD_DIR = DATA_DIR / "gold"

REPORTS_DIR = PROJECT_ROOT / "reports"

RAW_HR_CORE_FILE = RAW_DIR / "hr_core_employees.csv"
SILVER_HR_CORE_FILE = SILVER_DIR / "hr_core_employees_clean.csv"


# ============================================================
# PROJECT DATES
# ============================================================

REFERENCE_DATE = pd.Timestamp("2026-06-10")
START_DATE = pd.Timestamp("2020-01-01")


# ============================================================
# OFFICIAL HOTEL CATALOG
# ============================================================

VALID_HOTEL_CODES = [
    "HES001",
    "HES002",
    "HES003",
    "HES004",
    "HMX001",
    "HMX002",
    "HCU001",
    "HCU002",
    "HDR001",
]


HOTEL_CODE_MAPPING = {
    "PMI": "HES001",
    "PALMA": "HES001",
}


# ============================================================
# GENDER STANDARDIZATION
# ============================================================

GENDER_MAPPING = {
    "Male": "Male",
    "male": "Male",
    "M": "Male",
    "Female": "Female",
    "F": "Female",
    "Non Binary": "Non Binary",
}


VALID_GENDERS = [
    "Male",
    "Female",
    "Non Binary",
]


# ============================================================
# VALID BUSINESS VALUES
# ============================================================

VALID_EMPLOYEE_STATUS = [
    "Active",
    "Voluntary Termination",
    "Involuntary Termination",
    "Retirement",
    "Long Leave",
]


VALID_CONTRACT_TYPES = [
    "Permanent",
    "Temporary",
    "Seasonal",
    "Internship",
]


VALID_HIERARCHY_LEVELS = [
    "Director Hotel",
    "Manager",
    "Supervisor",
    "Staff",
]


# ============================================================
# ETL PARAMETERS
# ============================================================

MINIMUM_WORKING_AGE = 18


""" 
Este archivo guarda todo lo que no queremos repetir en otros scripts:

rutas del proyecto;
archivo RAW;
archivo Silver;
fecha de referencia;
catálogo oficial de hoteles;
reglas de mapeo para gender;
reglas de mapeo para hotel_code;
valores válidos del negocio. 
"""