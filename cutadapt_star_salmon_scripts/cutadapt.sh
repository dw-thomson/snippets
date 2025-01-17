#!/bin/bash

#SBATCH --job-name=cutadapt
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
#conda activate cutadaptenv
#mkdir -p cutadapt

cutadapt \
        -a CTGTCTCTTATACACATCT \
        -A CTGTCTCTTATACACATCT \
	-e 0.3 \
        -o cutadapt/${R1} \
        -p cutadapt/${R2} \
        ${R1} ${R2}

echo "finished"
