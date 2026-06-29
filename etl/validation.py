"""
GlobalStay Hotels - HR Analytics ETL Validation Module

Este módulo contiene las funciones de validación del pipeline ETL.
Su responsabilidad es evaluar reglas de calidad de datos sin modificar
el DataFrame original.
"""

import pandas as pd

from etl.config import (
    REFERENCE_DATE,
    VALID_HOTEL_CODES,
    VALID_GENDERS,
    VALID_EMPLOYEE_STATUS,
    VALID_CONTRACT_TYPES,
    VALID_HIERARCHY_LEVELS,
    MINIMUM_WORKING_AGE,
)


def validate_duplicate_employee_ids(df: pd.DataFrame) -> dict:
    """
    Valida si existen employee_id duplicados.
    """

    duplicated_count = df["employee_id"].duplicated().sum()

    return {
        "check": "duplicate_employee_ids",
        "status": "PASS" if duplicated_count == 0 else "FAIL",
        "affected_records": int(duplicated_count),
        "message": f"Se encontraron {duplicated_count} employee_id duplicados.",
    }


def validate_gender_values(df: pd.DataFrame) -> dict:
    """
    Valida si los valores de gender pertenecen al catálogo oficial.
    """

    invalid_values = df[~df["gender"].isin(VALID_GENDERS)]

    return {
        "check": "gender_values",
        "status": "PASS" if len(invalid_values) == 0 else "FAIL",
        "affected_records": int(len(invalid_values)),
        "message": f"Se encontraron {len(invalid_values)} registros con valores no estándar en gender.",
    }


def validate_hotel_codes(df: pd.DataFrame) -> dict:
    """
    Valida si los códigos de hotel pertenecen al catálogo oficial.
    """

    invalid_values = df[~df["hotel_code"].isin(VALID_HOTEL_CODES)]

    return {
        "check": "hotel_codes",
        "status": "PASS" if len(invalid_values) == 0 else "FAIL",
        "affected_records": int(len(invalid_values)),
        "message": f"Se encontraron {len(invalid_values)} registros con hotel_code no oficial.",
    }


def validate_birth_dates(df: pd.DataFrame) -> dict:
    """
    Valida si existen fechas de nacimiento futuras.
    """

    birth_dates = pd.to_datetime(df["birth_date"], errors="coerce")

    invalid_dates = df[birth_dates > REFERENCE_DATE]

    return {
        "check": "birth_dates",
        "status": "PASS" if len(invalid_dates) == 0 else "FAIL",
        "affected_records": int(len(invalid_dates)),
        "message": f"Se encontraron {len(invalid_dates)} fechas de nacimiento futuras.",
    }


def validate_hire_dates(df: pd.DataFrame) -> dict:
    """
    Valida si existen fechas de contratación futuras.
    """

    hire_dates = pd.to_datetime(df["hire_date"], errors="coerce")

    invalid_dates = df[hire_dates > REFERENCE_DATE]

    return {
        "check": "hire_dates",
        "status": "PASS" if len(invalid_dates) == 0 else "FAIL",
        "affected_records": int(len(invalid_dates)),
        "message": f"Se encontraron {len(invalid_dates)} fechas de contratación futuras.",
    }


def validate_termination_dates(df: pd.DataFrame) -> dict:
    """
    Valida si existen fechas de baja futuras.
    """

    termination_dates = pd.to_datetime(df["termination_date"], errors="coerce")

    invalid_dates = df[termination_dates > REFERENCE_DATE]

    return {
        "check": "termination_dates",
        "status": "PASS" if len(invalid_dates) == 0 else "FAIL",
        "affected_records": int(len(invalid_dates)),
        "message": f"Se encontraron {len(invalid_dates)} fechas de baja futuras.",
    }


def validate_termination_before_hire(df: pd.DataFrame) -> dict:
    """
    Valida si existen bajas anteriores a la fecha de contratación.
    """

    hire_dates = pd.to_datetime(df["hire_date"], errors="coerce")
    termination_dates = pd.to_datetime(df["termination_date"], errors="coerce")

    invalid_records = df[termination_dates < hire_dates]

    return {
        "check": "termination_before_hire",
        "status": "PASS" if len(invalid_records) == 0 else "FAIL",
        "affected_records": int(len(invalid_records)),
        "message": f"Se encontraron {len(invalid_records)} bajas anteriores a la contratación.",
    }


def validate_active_without_termination(df: pd.DataFrame) -> dict:
    """
    Valida que empleados activos no tengan fecha de baja.
    """

    invalid_records = df[
        (df["status"] == "Active") &
        (df["termination_date"].notna())
    ]

    return {
        "check": "active_with_termination",
        "status": "PASS" if len(invalid_records) == 0 else "FAIL",
        "affected_records": int(len(invalid_records)),
        "message": f"Se encontraron {len(invalid_records)} empleados activos con fecha de baja.",
    }


def validate_inactive_without_termination(df: pd.DataFrame) -> dict:
    """
    Valida que empleados inactivos tengan fecha de baja.
    """

    invalid_records = df[
        (df["status"] != "Active") &
        (df["termination_date"].isna())
    ]

    return {
        "check": "inactive_without_termination",
        "status": "PASS" if len(invalid_records) == 0 else "FAIL",
        "affected_records": int(len(invalid_records)),
        "message": f"Se encontraron {len(invalid_records)} empleados inactivos sin fecha de baja.",
    }


def validate_minimum_working_age(df: pd.DataFrame) -> dict:
    """
    Valida si existen empleados menores de la edad laboral mínima.
    """

    birth_dates = pd.to_datetime(df["birth_date"], errors="coerce")

    ages = ((REFERENCE_DATE - birth_dates).dt.days / 365.25).astype(int)

    invalid_records = df[ages < MINIMUM_WORKING_AGE]

    return {
        "check": "minimum_working_age",
        "status": "PASS" if len(invalid_records) == 0 else "FAIL",
        "affected_records": int(len(invalid_records)),
        "message": f"Se encontraron {len(invalid_records)} empleados menores de {MINIMUM_WORKING_AGE} años.",
    }


def run_hr_core_validations(df: pd.DataFrame) -> pd.DataFrame:
    """
    Ejecuta todas las validaciones del HR Core y devuelve un DataFrame
    con los resultados.
    """

    checks = [
        validate_duplicate_employee_ids(df),
        validate_gender_values(df),
        validate_hotel_codes(df),
        validate_birth_dates(df),
        validate_hire_dates(df),
        validate_termination_dates(df),
        validate_termination_before_hire(df),
        validate_active_without_termination(df),
        validate_inactive_without_termination(df),
        validate_minimum_working_age(df),
    ]

    return pd.DataFrame(checks)