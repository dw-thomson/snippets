#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=128G
#SBATCH --cpus-per-task=8
#SBATCH --time=0-12:00:00
#SBATCH --output=01-Cellranger_Count_log.slurm.%a.stdout
#SBATCH --array=1-4
#SBATCH --mail-user=daniel.thomson@sahmri.com
#SBATCH --mail-type=FAIL
#SBATCH --job-name="CellRanger Count"

## this is using cathal's version of cell ranger ##

## specify tools ##
cellranger='/homes/cathal.king/yard/apps/cellranger-7.1.0/cellranger'

declare -A DATA

DATA[1]='23-01159'
DATA[2]='23-01160'
DATA[3]='23-01233'
DATA[4]='23-01234'

#cellranger count --id=${DATA[$SLURM_ARRAY_TASK_ID]} --fastqs=/cancer/storage/SAGC/fastq/SAGCQA0632/V350164501/fastq/merged --sample=${DATA[$SLURM_ARRAY_TASK_ID]} --transcriptome=/homes/cathal.king/References/refdata-gex-mm10-2020-A

# changed names and soft-links fastqs from /cancer/storage/SAGC/fastq/SAGCQA0704/AGRF_CAGRF230715576_225VW3LT3/

${cellranger} count --id ${DATA[$SLURM_ARRAY_TASK_ID]} --sample=${DATA[$SLURM_ARRAY_TASK_ID]} --fastqs /homes/daniel.thomson/projects/SAGCQA0704/AGRF_CAGRF230715576_225VW3LT3/fastqs --transcriptome=/homes/cathal.king/References/refdata-gex-mm10-2020-A --localcores=20 --localmem=64 --no-bam
