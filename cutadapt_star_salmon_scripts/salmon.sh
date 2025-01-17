#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=64G
#SBATCH --cpus-per-task=8
#SBATCH --time=0-12:00:00
#SBATCH --output=01-Salmon_log.slurm.%a.stdout
#SBATCH --array=1-6
#SBATCH --mail-user=daniel.thomson@sahmri.com
#SBATCH --mail-type=FAIL
#SBATCH --job-name="Salmon"
#SBATCH --nodelist=hpc-lin-cmp09

#conda activate RNAseq

BaseDir='/cancer/storage/SAGC/projects/SAGCQA0888'
cd ${BaseDir}
mkdir -p ${BaseDir}/Salmon/

declare -A DATA
DATA[1]='K10R'
DATA[2]='MM135'
DATA[3]='MM142'
DATA[4]='MM143'
DATA[5]='MM144'
DATA[6]='MM145'

echo "running salmon"

# tried with fail
# -t /homes/daniel.thomson/References/GRCh38/Salmon/ncbi_dataset/data/GCF_000001405.40/rna.fna
# -t /homes/daniel.thomson/References/GRCh38/ncbi_dataset/data/GCF_000001405.40/cds_from_genomic.fna
# the problem wasn't the reference, it was that I wasn't giving it the transcriptome bam. I had to redo the mapping with --quantMode TranscriptomeBam 
# -a ${BaseDir}/star/${DATA[$SLURM_ARRAY_TASK_ID]}_star_outs/${DATA[$SLURM_ARRAY_TASK_ID]}_Aligned.sortedByCoord.out.bam \
# now it looks like something was missing from the the reference, I've know rerun Star genome generate with an Ensemble GrCH38 genome. and remapped,

salmon quant \
	-t /homes/daniel.thomson/References/GRCh38/Ensembl_download/gffread_output_RNA.fa\
        -l A \
	--gcBias  \
        -a ${BaseDir}/star_GRCh38Ensembl/${DATA[$SLURM_ARRAY_TASK_ID]}_star_outs/${DATA[$SLURM_ARRAY_TASK_ID]}_Aligned.toTranscriptome.out.bam \
        -o ${BaseDir}/Salmon/${DATA[$SLURM_ARRAY_TASK_ID]}

echo "################## finished #####################"

#salmon quant \
#        -t /homes/daniel.thomson/References/GRCh38/ncbi_dataset/data/GCF_000001405.40/rna.fna \
#        -l A \
#        -a ${BaseDir}/star/${DATA[$SLURM_ARRAY_TASK_ID]}_star_outs/${DATA[$SLURM_ARRAY_TASK_ID]}_Aligned.toTranscriptome.out.bam \
#        -o ${BaseDir}/Salmon/${DATA[$SLURM_ARRAY_TASK_ID]}
####!####SBATCH --partition=sahmri_cancer_hpc

## the --gcBias  flag was added following DEseq2 recommendation
