#!/bin/bash

#SBATCH --job-name=fastp
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

#conda activate cutadaptenv

R1=$1
R2=$2

####### Cutadapt ############
#conda activate RNAseq

#trying fastp autodetection

fastp \
	-i ${R1} \
	-I ${R2} \
	-o fastp/${R1} \
	-O fastp/${R2} \

echo "finished"
