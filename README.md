# Vallisneria Americana RNAseq

initial analysis of Vallisneria Americana. Mostly just trying to map and get counts for now.


fastqc:

```bash

module load gcc12-env/12.3.0
module load openjdk/17.0.5_8
module load singularity/3.11.5

nextflow run ~/val_rnaseq/scripts/fastqc.nf --input_dir ./rawdata --outdir ./fastqc_pre_trim -with-tower
```

fastp:

```bash
module load gcc12-env/12.3.0
module load openjdk/17.0.5_8
module load singularity/3.11.5

nextflow run ~/val_rnaseq/scripts/fastp.nf --fastq "./rawdata/*fastq.gz" -with-tower


nextflow run ~/val_rnaseq/scripts/fastqc.nf --input_dir ./analysis/trimmed_files/ --outdir ./analysis/multiqc_report_trimmed 
```

index: `star_index.sh`
