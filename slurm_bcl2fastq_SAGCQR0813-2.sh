#!/bin/bash

#SBATCH --job-name=bcl2fastq_umi
#SBATCH --mail-user=daniel.thomson@sahmri.com
#SBATCH --mail-type=FAIL
#SBATCH --output=bcl2fastq_umi.log

# Resources allocation request parameters
#SBATCH --partition=sahmri_prod_hpc
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=6000       # this will request 96 Gb of memory
#SBATCH --time=2-00:00:00          # Run time in hh:mm:s

## script adapted from Jimmy Breen (jimmymbreen@gmail.com)
## set up for new HPC
## 2020-07-03

#set -e
#set -o pipefail

RUN=/sequencers/sequencers/miseq/230912_M02873_0160_000000000-L6F7H
OUT=/cancer/storage/SAGC/fastq/SAGCQA0813_rerun
SHEET=/sequencers/sequencers/miseq/230912_M02873_0160_000000000-L6F7H/SampleSheet.csv
THREADS=8

# Demultiplex RUN using bcl2fastq2 (should be in your PATH)
# 	NB: If not, exec is at /usr/local/bin/bcl2fastq 

/apps/bioinfo/share/bcbio/anaconda_old/bin/bcl2fastq \
	--runfolder-dir ${RUN} \
	-p ${THREADS} \
	--output-dir ${OUT} \
#	--use-bases-mask Y*,I8Y8,Y* \
	--mask-short-adapter-reads=0 \
	--create-fastq-for-index-reads \
	--no-lane-splitting \
	--sample-sheet ${OUT}/SampleSheet-edit.csv \
	--minimum-trimmed-read-length=0 \
	--ignore-missing-positions \
	--ignore-missing-controls \
	--ignore-missing-filter


