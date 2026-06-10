
"""
GlobalStay Hotels - HR Analytics Project
Session 6 - Synthetic RAW DATA Generator

Objetivo:
Generar datasets sintéticos realistas para un proyecto profesional de HR Analytics.

Archivos RAW previstos:
- hr_core_employees.csv
- payroll_raw.csv
- time_tracking_raw.csv
- recruiting_raw.csv
- training_raw.csv
- esg_raw.csv

Periodo:
2020-01-01 al 2026-06-10
"""

import random
import numpy as np
import pandas as pd
from pathlib import Path
from datetime import datetime, timedelta

# =========================
# CONFIGURACIÓN GENERAL
# =========================

SEED = 42
random.seed(SEED)
np.random.seed(SEED)

PROJECT_DIR = Path(__file__).resolve().parents[1]
RAW_DIR = PROJECT_DIR / "data" / "raw"
RAW_DIR.mkdir(parents=True, exist_ok=True)

START_DATE = pd.Timestamp("2020-01-01")
END_DATE = pd.Timestamp("2026-06-10")

TOTAL_EMPLOYEES = 2700

COUNTRIES = {
    "Spain": {
        "currency": "EUR",
        "hotels": [
            ("HES001", "GlobalStay Palma Resort", "Palma de Mallorca", 360),
            ("HES002", "GlobalStay Madrid Business", "Madrid", 300),
            ("HES003", "GlobalStay Barcelona Beach", "Barcelona", 280),
            ("HES004", "GlobalStay Malaga Costa", "Malaga", 260),
        ],
    },
    "Mexico": {
        "currency": "MXN",
        "hotels": [
            ("HMX001", "GlobalStay Cancun Resort", "Cancun", 320),
            ("HMX002", "GlobalStay Riviera Maya", "Riviera Maya", 280),
        ],
    },
    "Cuba": {
        "currency": "CUP",
        "hotels": [
            ("HCU001", "GlobalStay La Habana", "La Habana", 250),
            ("HCU002", "GlobalStay Varadero Beach", "Varadero", 250),
        ],
    },
    "Dominican Republic": {
        "currency": "DOP",
        "hotels": [
            ("HDR001", "GlobalStay Punta Cana Resort", "Punta Cana", 400),
        ],
    },
}

DEPARTMENTS = {
    "HK": ("Housekeeping", 0.25),
    "FB": ("Food & Beverage", 0.22),
    "FD": ("Front Desk", 0.12),
    "MT": ("Maintenance", 0.10),
    "SC": ("Security", 0.08),
    "SW": ("Spa & Wellness", 0.07),
    "SM": ("Sales & Marketing", 0.05),
    "FN": ("Finance", 0.04),
    "HR": ("Human Resources", 0.04),
    "IT": ("Information Technology", 0.03),
}

CONTRACT_TYPES = {
    "Permanent": 0.65,
    "Temporary": 0.20,
    "Seasonal": 0.10,
    "Internship": 0.05,
}

HIERARCHY_LEVELS = {
    "Director Hotel": 0.01,
    "Manager": 0.07,
    "Supervisor": 0.17,
    "Staff": 0.75,
}

GENDERS = {
    "Female": 0.52,
    "Male": 0.47,
    "Non Binary": 0.01,
}

FIRST_NAMES = {
    "Female": ["Ana", "Laura", "Maria", "Lucia", "Sofia", "Carmen", "Isabel", "Valentina", "Camila", "Paula"],
    "Male": ["Juan", "Carlos", "Miguel", "Jose", "Luis", "Diego", "Fernando", "Pedro", "Javier", "Andres"],
    "Non Binary": ["Alex", "Sam", "Nico", "Ariel", "Noa"],
}

LAST_NAMES = [
    "Garcia", "Rodriguez", "Martinez", "Lopez", "Sanchez", "Perez",
    "Gonzalez", "Fernandez", "Diaz", "Torres", "Ramirez", "Morales",
    "Castro", "Romero", "Vargas", "Herrera"
]

STATUS_VALUES = ["Active", "Voluntary Termination", "Involuntary Termination", "Retirement", "Long Leave"]

# =========================
# FUNCIONES AUXILIARES
# =========================

def weighted_choice(options: dict):
    keys = list(options.keys())
    probs = list(options.values())
    return np.random.choice(keys, p=probs)

def random_date(start, end):
    days = (end - start).days
    return start + pd.Timedelta(days=random.randint(0, days))

def generate_birth_date():
    # Edades aproximadas entre 18 y 62 años al 2026
    age = np.random.choice(
        [random.randint(18, 25), random.randint(26, 35), random.randint(36, 45), random.randint(46, 55), random.randint(56, 62)],
        p=[0.20, 0.35, 0.25, 0.15, 0.05]
    )
    return END_DATE - pd.DateOffset(years=int(age)) - pd.DateOffset(days=random.randint(0, 365))

def generate_employee_name(gender):
    first_name = random.choice(FIRST_NAMES[gender])
    last_name = f"{random.choice(LAST_NAMES)} {random.choice(LAST_NAMES)}"
    return first_name, last_name

# =========================
# 1. HR CORE EMPLOYEES
# =========================

def generate_hr_core_employees():
    rows = []
    employee_num = 1

    for country, country_data in COUNTRIES.items():
        for hotel_code, hotel_name, city, hotel_employee_target in country_data["hotels"]:
            for _ in range(hotel_employee_target):
                employee_id = f"EMP{employee_num:05d}"
                gender = weighted_choice(GENDERS)
                first_name, last_name = generate_employee_name(gender)
                department_code = weighted_choice({k: v[1] for k, v in DEPARTMENTS.items()})
                contract_type = weighted_choice(CONTRACT_TYPES)
                hierarchy_level = weighted_choice(HIERARCHY_LEVELS)

                hire_date = random_date(START_DATE, END_DATE)
                birth_date = generate_birth_date()

                # Probabilidad de baja
                termination_date = None
                status = "Active"

                if hire_date < END_DATE - pd.DateOffset(months=6):
                    if random.random() < 0.12:
                        termination_date = random_date(hire_date + pd.DateOffset(months=1), END_DATE)
                        status = np.random.choice(
                            ["Voluntary Termination", "Involuntary Termination", "Retirement"],
                            p=[0.65, 0.28, 0.07]
                        )
                    elif random.random() < 0.02:
                        status = "Long Leave"

                rows.append({
                    "employee_id": employee_id,
                    "first_name": first_name,
                    "last_name": last_name,
                    "gender": gender,
                    "birth_date": birth_date.date(),
                    "hire_date": hire_date.date(),
                    "termination_date": termination_date.date() if termination_date is not None else None,
                    "status": status,
                    "hotel_code": hotel_code,
                    "hotel_name": hotel_name,
                    "city": city,
                    "country": country,
                    "department_code": department_code,
                    "department_name": DEPARTMENTS[department_code][0],
                    "contract_type": contract_type,
                    "hierarchy_level": hierarchy_level
                })

                employee_num += 1

    df = pd.DataFrame(rows)

    # =========================
    # ERRORES INTENCIONALES RAW
    # =========================

    # Duplicados
    duplicates = df.sample(15, random_state=SEED)
    df = pd.concat([df, duplicates], ignore_index=True)

    # Géneros inconsistentes
    idx = df.sample(20, random_state=SEED + 1).index
    df.loc[idx[:7], "gender"] = "male"
    df.loc[idx[7:14], "gender"] = "M"
    df.loc[idx[14:], "gender"] = "F"

    # Hotel codes inconsistentes
    idx = df.sample(10, random_state=SEED + 2).index
    df.loc[idx[:5], "hotel_code"] = "PMI"
    df.loc[idx[5:], "hotel_code"] = "PALMA"

    # Fechas inválidas simuladas
    idx = df.sample(5, random_state=SEED + 3).index
    df.loc[idx, "birth_date"] = pd.Timestamp("2030-05-10").date()

    output_path = RAW_DIR / "hr_core_employees.csv"
    df.to_csv(output_path, index=False, encoding="utf-8")

    return df

# =========================
# EJECUCIÓN
# =========================

if __name__ == "__main__":
    employees = generate_hr_core_employees()
    print("Archivo generado: data/raw/hr_core_employees.csv")
    print(f"Registros generados: {len(employees)}")
    print(employees.head())
