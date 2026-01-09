# SuperCYP - CYP450 Drug Metabolism Database

SuperCYP is a comprehensive database of Cytochrome P450 enzyme interactions with drugs and chemicals. This brick contains curated CYP450 substrate/non-substrate classifications for the major drug-metabolizing enzymes.

## Data Source

- **Original Database**: SuperCYP (Charité Berlin)
- **Curated Dataset**: https://figshare.com/articles/dataset/26630515
- **Reference**: Preissner et al., Nucleic Acids Research, 2010
- **License**: CC-BY 4.0

## CYP Enzymes Covered

These 6 CYP enzymes are responsible for ~90% of Phase I drug metabolism:

| Enzyme | Description |
|--------|-------------|
| CYP1A2 | Metabolizes caffeine, theophylline |
| CYP2C9 | Metabolizes warfarin, phenytoin |
| CYP2C19 | Metabolizes omeprazole, clopidogrel |
| CYP2D6 | Metabolizes codeine, antidepressants |
| CYP2E1 | Metabolizes ethanol, acetaminophen |
| CYP3A4 | Metabolizes ~50% of all drugs |

## Output Files

| File | Description |
|------|-------------|
| `brick/cyp450_combined.parquet` | Combined dataset for all CYP enzymes |
| `brick/cyp1a2.parquet` | CYP1A2 substrates/non-substrates |
| `brick/cyp2c9.parquet` | CYP2C9 substrates/non-substrates |
| `brick/cyp2c19.parquet` | CYP2C19 substrates/non-substrates |
| `brick/cyp2d6.parquet` | CYP2D6 substrates/non-substrates |
| `brick/cyp2e1.parquet` | CYP2E1 substrates/non-substrates |
| `brick/cyp3a4.parquet` | CYP3A4 substrates/non-substrates |

## Usage

```r
# R
biobricks::install_brick("supercyp")
biobricks::brick_pull("supercyp")
cyp <- biobricks::brick_load("supercyp")
```

```python
# Python
import biobricks as bb
bb.install("supercyp")
cyp = bb.load("supercyp", "cyp450_combined")
```

## Schema

| Column | Description |
|--------|-------------|
| chemical_name | Drug/chemical name |
| smiles | SMILES structure |
| labels | 1 = substrate, 0 = non-substrate |
| data_sources | Source databases (SuperCYP, DrugBank, etc.) |
| cyp_enzyme | CYP enzyme name |

## Applications

- Drug-drug interaction prediction
- Metabolic liability assessment
- CYP inhibition/induction screening
- QSAR model development

## Citation

Preissner S, et al. SuperCYP: a comprehensive database on Cytochrome P450 enzymes including a tool for analysis of CYP-drug interactions. Nucleic Acids Res. 2010;38:D237-D243.
