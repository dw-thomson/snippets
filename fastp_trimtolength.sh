#!/bin/bash

#SBATCH --job-name=fastp
#SBATCH --output=%x.%j.out

# Resources allocation request parameters
#SBATCH --partition=sahmri_prod_hpc

#SBATCH --mail-user=daniel.thomson@sahmri.com
#SBATCH --mail-type=FAIL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=6000       # this will request 96 Gb of memory
#SBATCH --time=3-00:00:00          # Run time in hh:mm:s

#set -e
#set -o pipefail

## specify tools
fastp='/apps/bioinfo/share/bcbio/anaconda_old/bin/fastp'


R1=$1
R2=$2

####### Fastqp trim to length  ############
mkdir -p fastq.trimmed

${fastp} --max_len1 28 \
	--max_len2 90 \
	-i ${R1} \
	-I ${R2} \
        -o fastq.trimmed/${R1} \
        -O fastq.trimmed/${R2}

echo "finished"
