# Guardar.

# Nada más.

# Por ejemplo:Silver CSV ... mas adelante en PostgreSQL

"""
GlobalStay Hotels - HR Analytics ETL Load Module

Este módulo contiene las funciones de carga del pipeline ETL.
Su responsabilidad es guardar los datos transformados en la capa Silver.
"""

import pandas as pd
from pathlib import Path

from etl.config import SILVER_HR_CORE_FILE


def load_hr_core_silver(
    df: pd.DataFrame,
    output_path: Path = SILVER_HR_CORE_FILE
) -> None:
    """
    Guarda el dataset HR Core limpio en la capa Silver.

    Parameters
    ----------
    df : pd.DataFrame
        DataFrame transformado y limpio.

    output_path : Path
        Ruta donde se guardará el archivo CSV limpio.
    """

    output_path.parent.mkdir(parents=True, exist_ok=True)

    df.to_csv(output_path, index=False, encoding="utf-8")

    print(f"Archivo guardado correctamente en: {output_path}")