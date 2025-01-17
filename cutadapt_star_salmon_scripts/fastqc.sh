#!/bin/bash

#SBATCH --job-name=fastqc
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

echo $R1
echo $R2

####### Fastqc  ############


/apps/bioinfo/bin/FastQC/fastqc -t 6 ${R1} ${R2}


echo "finished"
