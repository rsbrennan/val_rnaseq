#!/bin/bash
#SBATCH -D /gxfs_home/geomar/smomw504/val_rnaseq/logout/
#SBATCH --mail-type=END
#SBATCH --mail-user=rbrennan@geomar.de
#SBATCH --partition=base
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=200G
#SBATCH --time=8:00:00
#SBATCH --job-name=krackenC
#SBATCH --output=%x.%A.out
#SBATCH --error=%x.%A.err

# use base with 200 gb ram 16 cpus

# classify

for i in 12-F-2-4_S180_L001 12-G-1-6_S186_L002 12-C-3-3_S150_L001 12-D-1-2_S109_L001; do
    ~/bin/kraken2 --db $WORK/val_rnaseq/kraken2_db/pluspf/ \
        --threads 12 \
        --fastq-input /gxfs_work/geomar/smomw504/val_rnaseq/rawdata/${i}_R1_001.clip.fastq.gz \
        --gzip-compressed \
        --report $WORK/val_rnaseq/analysis/kraken/report_${i} \
        --output $WORK/val_rnaseq/analysis/kraken/output_${i} \
        --classified-out $WORK/val_rnaseq/analysis/kraken/${i}.classified \
        --unclassified-out $WORK/val_rnaseq/analysis/kraken/${i}.unclassified
done
