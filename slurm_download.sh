#!/bin/bash

#SBATCH --job-name=CATdownload
#SBATCH --output=CATdownload.log

# Resources allocation request parameters

#SBATCH --mail-user=daniel.thomson@sahmri.com
#SBATCH --mail-type=FAIL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=6000       # this will request 96 Gb of memory
#SBATCH --time=3-00:00:00          # Run time in hh:mm:s

cd /homes/daniel.thomson/References/CAT_taxonomy_database

wget  https://tbb.bio.uu.nl/bastiaan/CAT_prepare/CAT_prepare_20210107.tar.gz /homes/daniel.thomson/References/CAT_taxonomy_database

echo "finished"
