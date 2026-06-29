
# Cada vez que ejecutemos el ETL obtendremos algo parecido a esto:

# ================================

# GlobalStay Hotels ETL

# ================================

# RAW Records........2715

# Duplicados.........15

# Gender corregidos..20

# Hotel corregidos...9

# Tiempo.............2.3 segundos

# Estado.............SUCCESS

# Esto se parece muchísimo a los logs que generan herramientas como Airflow o Azure Data Factory.



"""
GlobalStay Hotels - HR Analytics ETL Logger Module
"""

from datetime import datetime


def print_etl_summary(
    raw_records: int,
    silver_records: int,
    validation_before,
    validation_after,
):
    """
    Imprime un resumen de la ejecución del pipeline ETL.
    """

    print("\n")
    print("=" * 60)
    print(" GLOBALSTAY HOTELS - HR ETL PIPELINE")
    print("=" * 60)

    print(f"Fecha ejecución : {datetime.now():%Y-%m-%d %H:%M:%S}")
    print()

    print(f"RAW Records     : {raw_records}")
    print(f"Silver Records  : {silver_records}")

    print()
    print("Validaciones antes del ETL")

    print(validation_before)

    print()
    print("Validaciones después del ETL")

    print(validation_after)

    print()
    print("Estado Pipeline : SUCCESS")

    print("=" * 60)