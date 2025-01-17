#!/bin/bash

#SBATCH --job-name=kraken2
#SBATCH --output=%x.%j.out

# Resources allocation request parameters

#SBATCH --mail-user=daniel.thomson@sahmri.com
#SBATCH --mail-type=FAIL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=6000       # this will request 96 Gb of memory
#SBATCH --time=3-00:00:00          # Run time in hh:mm:s

#set -e
#set -o pipefail

R1=$1
R2=$2
sample_id=${R1/_S1_L001_R1_001.fastq.gz/}

echo $R1
echo $R2
echo $sample_id

####### Cutadapt ############

kraken2 \
        --db /data/bioinformatics/bcbio_genomes/others/kraken2_standard_20200919\
        --quick \
        --paired \
	--threads 16 \
        --gzip-compressed \
        --memory-mapping \
        --report ${sample_id}.kraken2 \
        ${R1} ${R2}

echo "finished"
