#!/usr/bin/env python3
"""
Build script to convert CYP450 interaction data to Parquet format.
Contains substrate/non-substrate classifications for major CYP enzymes.
"""

import os
from pathlib import Path
import pandas as pd

def main():
    raw_path = Path("raw")
    brick_path = Path("brick")
    brick_path.mkdir(exist_ok=True)

    all_data = []

    # Process all CSV files
    for csv_file in raw_path.rglob("*.csv"):
        print(f"Processing {csv_file.name}...")

        try:
            df = pd.read_csv(csv_file, low_memory=False)

            # Standardize column names
            df.columns = [str(c).strip().lower().replace(' ', '_').replace('-', '_')
                         for c in df.columns]

            # Determine CYP enzyme from filename
            cyp_name = None
            for cyp in ['1a2', '2c9', '2c19', '2d6', '2e1', '3a4']:
                if cyp in csv_file.stem.lower():
                    cyp_name = f"CYP{cyp.upper()}"
                    break

            if cyp_name:
                df['cyp_enzyme'] = cyp_name

            # Save individual file
            output_name = csv_file.stem.lower()
            output_file = brick_path / f"{output_name}.parquet"
            df.to_parquet(output_file, index=False)
            print(f"  - Saved {len(df)} rows to {output_file}")

            all_data.append(df)

        except Exception as e:
            print(f"  - Error: {e}")

    # Create combined dataset
    if all_data:
        combined = pd.concat(all_data, ignore_index=True)
        combined_file = brick_path / "cyp450_combined.parquet"
        combined.to_parquet(combined_file, index=False)
        print(f"\nCombined dataset: {len(combined)} total records")

    # Print summary
    print("\nOutput files:")
    for f in brick_path.glob("*.parquet"):
        df = pd.read_parquet(f)
        print(f"  - {f.name}: {len(df)} rows")

if __name__ == "__main__":
    main()
