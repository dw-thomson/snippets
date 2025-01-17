#!/bin/bash

#SBATCH --job-name=Star
#SBATCH --output=%x.%j.out

# Resources allocation request parameters
#SBATCH --partition=sahmri_prod_hpc

#SBATCH --mail-user=daniel.thomson@sahmri.com
#SBATCH --mail-type=FAIL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=6000       # this will request 96 Gb of memory
#SBATCH --time=1-00:00:00          # Run time in hh:mm:s

#set -e
#set -o pipefail

#STAR    --runMode genomeGenerate \
#        --genomeDir /homes/daniel.thomson/References/GRCh38 \
#        --genomeFastaFiles /homes/daniel.thomson/References/GRCh38/ncbi_dataset/data/GCF_000001405.40/GCF_000001405.40_GRCh38.p14_genomic.fna \
#        --sjdbGTFfile /homes/daniel.thomson/References/GRCh38/ncbi_dataset/data/GCF_000001405.40/genomic.gtf \
#        --sjdbOverhang 149 \
#        --runThreadN 4


##DT
# STAR is in my path
# /homes/daniel.thomson/bin/STAR/bin/Linux_x86_64

fastqDir='/cancer/storage/SAGC/projects/SAGCQA0888/fastq.renamed/fastp'
outDir='/cancer/storage/SAGC/projects/SAGCQA0888/star_GeneCounts'

echo "running star mapping"

R1=$1
R2=${R1/R1/R2}
samplePrefix=${R1/_S1_L001_R1_001.fastq.gz/_}

echo "R1 = " ${R1}
echo "R2 = " ${R2}
echo "samplePrefix =" ${samplePrefix}

mkdir -p ${outDir}
cd ${outDir}
mkdir -p ${samplePrefix}star_outs
cd ${samplePrefix}star_outs

##using 'ENCODE' parameters from Star manual

STAR --runThreadN 4 \
        --genomeDir /homes/daniel.thomson/References/GRCh38/Star_GRCh38 \
        --readFilesIn ${fastqDir}/$R1 ${fastqDir}/$R2 \
	--readFilesCommand zcat \
	--outFilterType BySJout \
	--outFilterMultimapNmax 20 \
	--alignSJoverhangMin 8 \
	--alignSJDBoverhangMin 1 \
	--outFilterMismatchNmax 999 \
	--outFilterMismatchNoverReadLmax 0.04 \
	--alignIntronMin 20 \
	--alignIntronMax 1000000 \
	--alignMatesGapMax 1000000 \
	--outFileNamePrefix ${outDir}/${samplePrefix}star_outs/${samplePrefix} \
	--outSAMtype BAM SortedByCoordinate \
	--quantMode GeneCounts


## added these
#--quantMode TranscriptomeBam
#

echo "################## finished #####################"
