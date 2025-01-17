#!/bin/bash

#SBATCH --job-name=gunzip
#SBATCH --mail-user=daniel.thomson@sahmri.com
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --output=SLURM.log

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=32G
#SBATCH --time=12:15:25

R1=$1

#gunzip $R1

gzip $R1
echo '######done######'

