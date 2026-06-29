"""
GlobalStay Hotels - HR Analytics ETL Transform Module

Este módulo contiene las funciones de transformación del pipeline ETL.
Su responsabilidad es limpiar, estandarizar y preparar los datos del
HR Core para la capa Silver.
"""

import pandas as pd

from etl.config import (
    REFERENCE_DATE,
    GENDER_MAPPING,
    HOTEL_CODE_MAPPING,
    MINIMUM_WORKING_AGE,
)


def remove_duplicate_employees(df: pd.DataFrame) -> pd.DataFrame:
    """
    Elimina registros duplicados según employee_id.
    Conserva la primera aparición.
    """

    return df.drop_duplicates(subset="employee_id", keep="first").copy()


def standardize_gender(df: pd.DataFrame) -> pd.DataFrame:
    """
    Estandariza los valores de la columna gender.
    """

    df = df.copy()
    df["gender"] = df["gender"].map(GENDER_MAPPING)

    return df


def reconcile_hotel_codes(df: pd.DataFrame) -> pd.DataFrame:
    """
    Reconcila códigos de hotel no oficiales contra el catálogo oficial.
    """

    df = df.copy()
    df["hotel_code"] = df["hotel_code"].replace(HOTEL_CODE_MAPPING)

    return df


def convert_date_columns(df: pd.DataFrame) -> pd.DataFrame:
    """
    Convierte columnas de fecha al tipo datetime.
    """

    df = df.copy()

    date_columns = [
        "birth_date",
        "hire_date",
        "termination_date",
    ]

    for column in date_columns:
        df[column] = pd.to_datetime(df[column], errors="coerce")

    return df


def calculate_age(df: pd.DataFrame) -> pd.DataFrame:
    """
    Calcula la edad del empleado según la fecha de referencia del proyecto.
    """

    df = df.copy()

    age_years = (REFERENCE_DATE - df["birth_date"]).dt.days / 365.25

    df["age"] = age_years.apply(lambda x: int(x) if pd.notna(x) else pd.NA)

    return df


def flag_invalid_birth_dates(df: pd.DataFrame) -> pd.DataFrame:
    """
    Marca fechas de nacimiento futuras o empleados menores de edad.
    No elimina registros; solo crea una bandera de calidad.
    """

    df = df.copy()

    df["invalid_birth_date_flag"] = (
        (df["birth_date"] > REFERENCE_DATE) |
        (df["age"] < MINIMUM_WORKING_AGE)
    )

    return df


def flag_inactive_without_termination(df: pd.DataFrame) -> pd.DataFrame:
    """
    Marca empleados inactivos que no tienen fecha de baja registrada.
    """

    df = df.copy()

    df["inactive_without_termination_flag"] = (
        (df["status"] != "Active") &
        (df["termination_date"].isna())
    )

    return df


def transform_hr_core(df: pd.DataFrame) -> pd.DataFrame:
    """
    Ejecuta todas las transformaciones del HR Core.
    """

    df = remove_duplicate_employees(df)
    df = standardize_gender(df)
    df = reconcile_hotel_codes(df)
    df = convert_date_columns(df)
    df = calculate_age(df)
    df = flag_invalid_birth_dates(df)
    df = flag_inactive_without_termination(df)

    return df