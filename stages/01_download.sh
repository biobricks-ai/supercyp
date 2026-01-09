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

echo "Downloading CYP450 interaction datasets from Figshare..."

# Curated CYP450 Dataset from Figshare (article 26630515)
# Individual CSV files for each CYP enzyme
# CYP1A2 Testing Set
wget -nv -O "$downloadpath/CYP1A2_testingset.csv" \
    "https://figshare.com/ndownloader/files/53278934" || \
    echo "Warning: Could not download CYP1A2 testing set"

# CYP2C9 Testing Set
wget -nv -O "$downloadpath/CYP2C9_testingset.csv" \
    "https://figshare.com/ndownloader/files/53278952" || \
    echo "Warning: Could not download CYP2C9 testing set"

# CYP2C19 Testing Set
wget -nv -O "$downloadpath/CYP2C19_testingset.csv" \
    "https://figshare.com/ndownloader/files/53278949" || \
    echo "Warning: Could not download CYP2C19 testing set"

# CYP2D6 Testing Set
wget -nv -O "$downloadpath/CYP2D6_testingset.csv" \
    "https://figshare.com/ndownloader/files/53278955" || \
    echo "Warning: Could not download CYP2D6 testing set"

# CYP3A4 Testing Set
wget -nv -O "$downloadpath/CYP3A4_testingset.csv" \
    "https://figshare.com/ndownloader/files/53278961" || \
    echo "Warning: Could not download CYP3A4 testing set"

echo "Download complete."
ls -lh "$downloadpath"
