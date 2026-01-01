# PTM Position Remapping


## Installation

**[⬇️ Click here to install in Cauldron](http://localhost:50060/install?repo=https%3A%2F%2Fgithub.com%2Fnoatgnu%2Fptm-remap-plugin)** _(requires Cauldron to be running)_

> **Repository**: `https://github.com/noatgnu/ptm-remap-plugin`

**Manual installation:**

1. Open Cauldron
2. Go to **Plugins** → **Install from Repository**
3. Paste: `https://github.com/noatgnu/ptm-remap-plugin`
4. Click **Install**

**ID**: `ptm-remap`  
**Version**: 1.0.0  
**Category**: utilities  
**Author**: Cauldron Team

## Description

Remap PTM positions from peptides to protein sequences using UniProt data

## Runtime

- **Environments**: `python`

- **Entrypoint**: `remap_ptm.py`

## Inputs

| Name | Label | Type | Required | Default | Visibility |
|------|-------|------|----------|---------|------------|
| `input_file` | Input File | file | Yes | - | Always visible |
| `peptide_column` | Peptide Sequence Column | column | Yes | - | Always visible |
| `position_in_peptide_column` | Position in Peptide Column | column | Yes | - | Always visible |
| `uniprot_acc_column` | UniProt Accession Column | column | Yes | - | Always visible |
| `fasta_file` | FASTA File (Optional) | file | No | - | Always visible |

### Input Details

#### Input File (`input_file`)

Tab-separated or CSV file containing peptide data


#### Peptide Sequence Column (`peptide_column`)

Column containing peptide sequences


#### Position in Peptide Column (`position_in_peptide_column`)

Column containing the position of the PTM within the peptide


#### UniProt Accession Column (`uniprot_acc_column`)

Column containing UniProt accession IDs


#### FASTA File (Optional) (`fasta_file`)

Optional FASTA file with protein sequences. If not provided, sequences will be fetched from UniProt.


## Outputs

| Name | File | Type | Format | Description |
|------|------|------|--------|-------------|
| `remapped_peptides.txt` | `remapped_peptides.txt` | data |  | Tab-separated file with remapped PTM positions |

## Requirements

- **Python Version**: >=3.10

### Python Dependencies (External File)

Dependencies are defined in: `requirements.txt`

- `pandas>=2.0.0`
- `click>=8.0.0`
- `uniprotparser>=1.0.0`

> **Note**: When you create a custom environment for this plugin, these dependencies will be automatically installed.

## Usage

### Via UI

1. Navigate to **utilities** → **PTM Position Remapping**
2. Fill in the required inputs
3. Click **Run Analysis**

### Via Plugin System

```typescript
const jobId = await pluginService.executePlugin('ptm-remap', {
  // Add parameters here
});
```
