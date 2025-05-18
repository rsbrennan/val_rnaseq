#!/bin/bash
#SBATCH -D /gxfs_home/geomar/smomw504/val_rnaseq/logout/
#SBATCH --mail-type=END
#SBATCH --mail-user=rbrennan@geomar.de
#SBATCH --partition=data
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10G
#SBATCH --time=8:00:00
#SBATCH --job-name=krackenDB
#SBATCH --output=%x.%A.out
#SBATCH --error=%x.%A.err

cd $WORK/val_rnaseq/kraken2_db/pluspf
# Download the PlusPF database (this is large - ~100GB)
wget https://genome-idx.s3.amazonaws.com/kraken/k2_pluspf_20250402.tar.gz

# Extract the database
tar -xzf k2_pluspf_20250402.tar.gz
