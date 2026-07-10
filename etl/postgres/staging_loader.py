"""
GlobalStay Hotels - PostgreSQL Staging Loader

Este módulo carga el dataset Silver de HR Core en la tabla
staging.hr_core_employees de PostgreSQL.
"""

import pandas as pd

from etl.config import SILVER_HR_CORE_FILE
from etl.postgres.connection import get_postgres_engine


def load_hr_core_to_staging() -> None:
    """
    Carga el archivo Silver HR Core en la tabla staging.hr_core_employees.
    """

    print("Iniciando carga de HR Core hacia staging...")

    df = pd.read_csv(SILVER_HR_CORE_FILE)

    engine = get_postgres_engine()

    df.to_sql(
        name="hr_core_employees",
        con=engine,
        schema="staging",
        if_exists="replace",
        index=False,
        method="multi",
    )

    print(f"Registros cargados en staging.hr_core_employees: {len(df)}")


if __name__ == "__main__":
    load_hr_core_to_staging()