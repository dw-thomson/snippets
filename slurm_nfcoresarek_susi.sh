#!/bin/bash

#SBATCH --job-name=nfsarek
#SBATCH --output=nfsarek.log

# Resources allocation request parameters

#SBATCH --mail-user=daniel.thomson@sahmri.com
#SBATCH --mail-type=FAIL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=6000       # this will request 96 Gb of memory
#SBATCH --time=3-00:00:00          # Run time in hh:mm:s
#SBATCH --nodelist=hpc-lin-cmp09


nextflow run nf-core/sarek --input /homes/daniel.thomson/projects/SAGCQA0547_SusanWoods_WES/SampleSheet_forSarek_human.csv --outdir /homes/daniel.thomson/projects/SAGCQA0547_SusanWoods_WES/nf-core-sarek_outputs --genome GATK.GRCh38 -profile singularity

echo "finished"


