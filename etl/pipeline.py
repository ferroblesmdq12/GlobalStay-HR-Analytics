# Este será el cerebro.

# No hará transformaciones.

# Solo coordinará.

# Algo así:

# Extract()

# ↓

# Pre - Validate()

# ↓

# Transform()

# ↓

# Validate()

# ↓

# Load()

# ↓

# Logger()



"""
GlobalStay Hotels - HR Analytics ETL Pipeline
"""

from etl.extract import extract_hr_core
from etl.validation import run_hr_core_validations
from etl.transform import transform_hr_core
from etl.load import load_hr_core_silver
from etl.logger import print_etl_summary


def run_pipeline():

    print("Iniciando pipeline ETL...")

    # =====================================
    # EXTRACT
    # =====================================

    raw_df = extract_hr_core()

    # =====================================
    # VALIDATION BEFORE
    # =====================================

    validation_before = run_hr_core_validations(raw_df)

    # =====================================
    # TRANSFORM
    # =====================================

    silver_df = transform_hr_core(raw_df)

    # =====================================
    # VALIDATION AFTER
    # =====================================

    validation_after = run_hr_core_validations(silver_df)

    # =====================================
    # LOAD
    # =====================================

    load_hr_core_silver(silver_df)

    # =====================================
    # LOG
    # =====================================

    print_etl_summary(
        raw_records=len(raw_df),
        silver_records=len(silver_df),
        validation_before=validation_before,
        validation_after=validation_after,
    )


if __name__ == "__main__":
    run_pipeline()