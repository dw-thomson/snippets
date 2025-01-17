#!/bin/bash

#SBATCH --job-name=fastqc
#SBATCH --output=fastqc.log

# Resources allocation request parameters
#SBATCH --partition=sahmri_prod_hpc

#set -e


echo "fastqc"

cd /homes/daniel.thomson/projects/Susan_Woods/SAGCQA0546_copy/F350002760_1/fastq/lanes_merged

mkdir -p /homes/daniel.thomson/projects/Susan_Woods/SAGCQA0546_copy/F350002760_1/fastq/lanes_merged/fastQC

for input in $(ls *_L001_R*_001.fastq.gz) ; do /apps/bioinfo/bin/FastQC/fastqc $input --extract -o /homes/daniel.thomson/projects/Susan_Woods/SAGCQA0546_copy/F350002760_1/fastq/lanes_merged/fastQCfastQC ; done

echo "done"
