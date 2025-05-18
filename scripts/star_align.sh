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
#SBATCH --job-name=align_star
#SBATCH --output=%x.%A.out
#SBATCH --error=%x.%A.err
#SBATCH --array=1-55%20



OUTDIR="/gxfs_work/geomar/smomw504/val_rnaseq/analysis/star_aligned"
SAMPLE_LIST="${HOME}/val_rnaseq/scripts/sample_list.txt"

cd /gxfs_work/geomar/smomw504/val_rnaseq/analysis/trimmed_files

# Get the sample ID from the task list file
sample_id=$(sed -n "${SLURM_ARRAY_TASK_ID}p" "${SAMPLE_LIST}")


# Create comma-separated list of input files for this sample
input_files=$(ls ${sample_id}_L00[1-2]_R1_001.clip.fastq.gz | tr '\n' ',' | sed 's/,$//')


echo "Processing sample: ${sample_id}"
echo "Input files: ${input_files}"
echo "Output directory: ${OUTDIR}"

# Run STAR alignment
~/bin/STAR-2.7.11b/source/STAR --runThreadN $SLURM_CPUS_PER_TASK \
     --genomeDir /gxfs_work/geomar/smomw504/val_rnaseq/analysis/star_index \
     --readFilesIn ${input_files} \
     --readFilesCommand zcat \
     --quantMode GeneCounts \
     --outSAMtype BAM SortedByCoordinate \
      --outFileNamePrefix ${OUTDIR}/${sample_id}_ \
	 --outFilterMultimapNmax 20 \
     --outSAMattributes Standard

