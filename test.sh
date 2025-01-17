#!/bin/bash

#SBATCH --job-name=testing
#SBATCH --output=zcat.log

# Resources allocation request parameters

#SBATCH --mail-user=daniel.thomson@sahmri.com
#SBATCH --mail-type=FAIL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=6000       # this will request 96 Gb of memory
#SBATCH --time=3-00:00:00          # Run time in hh:mm:s
#SBATCH --nodelist=hpc-lin-cmp06


## 2020-08-18

#set -e
#set -o pipefail

echo "starting"
#zcat  /tmp/shayan/sequencers/T7/test_rsync/fq_data_to_test.fastq.gz | wc -l

echo "finished"
