#!/usr/bin/env bash

# Script to download CYP450 drug metabolism data
# Primary source: Curated CYP450 Interaction Dataset on Figshare
# Contains data from SuperCYP, DrugBank, and other sources
# https://figshare.com/articles/dataset/26630515

set -euo pipefail

localpath=$(pwd)
echo "Local path: $localpath"

downloadpath="$localpath/download"
mkdir -p "$downloadpath"

echo "Downloading CYP450 interaction datasets..."

# Curated CYP450 Dataset from Figshare
# Contains ~2000 compounds per CYP enzyme (CYP1A2, CYP2C9, CYP2C19, CYP2D6, CYP2E1, CYP3A4)
wget -nv -O "$downloadpath/cyp450_curated.zip" \
    "https://figshare.com/ndownloader/files/53278934" || \
    echo "Warning: Could not download CYP450 curated dataset"

echo "Download complete."
ls -lh "$downloadpath"
