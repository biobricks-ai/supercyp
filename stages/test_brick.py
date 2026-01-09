#!/usr/bin/env python3
"""
Test script to validate the supercyp brick data.
"""

import sys
from pathlib import Path
import pandas as pd

def test_brick():
    brick_path = Path("brick")

    # Check for parquet files
    parquet_files = list(brick_path.glob("*.parquet"))

    if len(parquet_files) < 1:
        print(f"FAIL: No parquet files found in {brick_path}")
        return False

    total_records = 0
    for pf in parquet_files:
        df = pd.read_parquet(pf)
        total_records += len(df)
        print(f"  - {pf.name}: {len(df)} rows")

    # Should have substantial data (2000 compounds per enzyme)
    if total_records < 1000:
        print(f"FAIL: Expected at least 1000 total records, got {total_records}")
        return False

    print(f"\nPASS: SuperCYP brick validated")
    print(f"  - Total files: {len(parquet_files)}")
    print(f"  - Total records: {total_records}")
    return True

if __name__ == "__main__":
    success = test_brick()
    sys.exit(0 if success else 1)
