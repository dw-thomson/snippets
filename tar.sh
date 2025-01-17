#!/bin/bash

#SBATCH --job-name=tar
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


directory=$1

####### Fastqp trim to length  ############
mkdir -p for_filesender

tar -cvf for_filesender/${directory}.tar ${directory}

echo "finished"
