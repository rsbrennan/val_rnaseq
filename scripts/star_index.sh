#!/bin/bash
#SBATCH -D /gxfs_home/geomar/smomw504/val_rnaseq/logout/
#SBATCH --mail-type=END
#SBATCH --mail-user=rbrennan@geomar.de
#SBATCH --partition=base
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=80G
#SBATCH --time=8:00:00
#SBATCH --job-name=index_star
#SBATCH --output=%x.%A.out
#SBATCH --error=%x.%A.err


# Create directories
mkdir -p /gxfs_work/geomar/smomw504/val_rnaseq/analysis/star_index

cd /gxfs_work/geomar/smomw504/val_rnaseq/analysis/

# Generate genome index
~/bin/STAR-2.7.11b/source/STAR --runMode genomeGenerate \
     --genomeDir star_index \
     --genomeFastaFiles /gxfs_work/geomar/smomw504/val_rnaseq/genome/zmarina/Zmarina_668_v2.0.fa \
     --sjdbGTFfile /gxfs_work/geomar/smomw504/val_rnaseq/genome/zmarina/ZosmaV2_all.gtf \
	 --genomeSAindexNbases 12 \
     --runThreadN 8
