"""
GlobalStay Hotels - PostgreSQL Connection Module

Este módulo crea la conexión a PostgreSQL usando variables de entorno.
"""

import os
from dotenv import load_dotenv
from sqlalchemy import create_engine


load_dotenv()


def get_postgres_engine():
    """
    Crea y devuelve un SQLAlchemy engine para PostgreSQL.
    """

    db_host = os.getenv("DB_HOST", "localhost")
    db_port = os.getenv("DB_PORT", "5432")
    db_name = os.getenv("DB_NAME", "globalstay_dw")
    db_user = os.getenv("DB_USER", "postgres")
    db_password = os.getenv("DB_PASSWORD", "")

    if db_password:
        connection_string = (
            f"postgresql+psycopg2://{db_user}:{db_password}"
            f"@{db_host}:{db_port}/{db_name}"
        )
    else:
        connection_string = (
            f"postgresql+psycopg2://{db_user}"
            f"@{db_host}:{db_port}/{db_name}"
        )

    engine = create_engine(connection_string)

    return engine