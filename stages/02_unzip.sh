#!/usr/bin/env bash

# Script to extract CYP450 dataset

set -euo pipefail

localpath=$(pwd)
downloadpath="$localpath/download"
rawpath="$localpath/raw"

mkdir -p "$rawpath"

echo "Extracting CYP450 datasets..."

# Check if it's a zip file or directory of CSVs
for file in "$downloadpath"/*; do
    if [[ "$file" == *.zip ]]; then
        echo "Extracting $(basename $file)..."
        unzip -o -q "$file" -d "$rawpath"
    elif [[ "$file" == *.csv ]]; then
        cp "$file" "$rawpath/"
    fi
done

echo "Extraction complete."
find "$rawpath" -type f | head -20
