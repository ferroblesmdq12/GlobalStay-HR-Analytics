# Una única responsabilidad:

# Leer los datos.

# Nada más. ejemplo: CSV ---> DataFrame

# solo Extrae

"""
GlobalStay Hotels - HR Analytics ETL Extract Module

Este módulo contiene las funciones de extracción del pipeline ETL.
Su responsabilidad es leer los datos desde la capa RAW y devolverlos
como DataFrames de Pandas.
"""

import pandas as pd
from pathlib import Path

from etl.config import RAW_HR_CORE_FILE


def extract_hr_core(file_path: Path = RAW_HR_CORE_FILE) -> pd.DataFrame:
    """
    Extrae el dataset HR Core desde la capa RAW.

    Parameters
    ----------
    file_path : Path
        Ruta del archivo CSV de HR Core.

    Returns
    -------
    pd.DataFrame
        DataFrame con los datos RAW de empleados.

    Raises
    ------
    FileNotFoundError
        Si el archivo no existe en la ruta indicada.
    """

    if not file_path.exists():
        raise FileNotFoundError(f"No se encontró el archivo: {file_path}")

    df = pd.read_csv(file_path)

    return df