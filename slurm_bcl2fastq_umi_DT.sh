#!/bin/bash

#SBATCH --job-name=bcl2fastq_umi
#SBATCH --mail-user=daniel.thomson@sahmri.com
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
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
## 2020-07-03

#set -e
#set -o pipefail

RUN=$1
OUT=$2
#SHEET=$3
THREADS=8

EXPERIMENT=$(grep "^Experiment" ${SHEET} | sed 's/^Experiment Name,\(.*\)$/\1/g')

#bcl2fastq2=/usr/local/bin/bcl2fastq
fastp=/apps/bioinfo/share/bcbio/anaconda/bin/fastp

# Make sure OUTdirectory is alive
mkdir -p ${OUT}

# change samplesheet to remove dummy index/umi bit
sed 's/AGCTAGCT,/,/g' ${RUN}/SampleSheet.csv > ${OUT}/SampleSheet-edit.csv

# Demultiplex RUN using bcl2fastq2 (should be in your PATH)
# 	NB: If not, exec is at /usr/local/bin/bcl2fastq 
/apps/bioinfo/share/bcbio/anaconda/bin/bcl2fastq \
	--runfolder-dir ${RUN} \
	-p ${THREADS} \
	--output-dir ${OUT} \
	--use-bases-mask Y*,I8Y8,Y* \
	--mask-short-adapter-reads=8 \
	--create-fastq-for-index-reads \
	--no-lane-splitting \
	--sample-sheet ${OUT}/SampleSheet-edit.csv \
	--minimum-trimmed-read-length=8 \
	--ignore-missing-positions \
	--ignore-missing-controls \
	--ignore-missing-filter 

#rm -rf ${OUT}/Reports ${OUT}/Stats ${OUT}/Undetermined*

# Extract reads from project folder into main directory
find ${OUT}/ -name "*.fastq.gz" -type f -exec mv -v {} ${OUT}/ \;

# Extract umi info from R2 (which is the UMI read only) and add to R1 (read pair 1) and R3 (read pair 2)
# 	(confusing I know..)
for FQGZ in ${OUT}/*R1_001*.fastq.gz; do
	
	# Run umi add on Read1 (R1 of the pair) using UMI read2
	${fastp} -i ${FQGZ} -I ${FQGZ/R1_001/R2_001} \
		-o ${OUT}/"$(basename ${FQGZ} _R1_001.fastq.gz)"_1.fastq.gz \
		-O ${OUT}/"$(basename ${FQGZ} _R1_001.fastq.gz)"_umi1.fastq.gz \
		--umi --umi_loc=read2 --umi_len=8 -G -Q -A -L -w 1 -u 100 -n 8 -Y 100

	# Run for Read2 (here read3)
	${fastp} -i ${FQGZ/R1_001/R3_001} -I ${FQGZ/R1_001/R2_001} \
                -o ${OUT}/"$(basename ${FQGZ} _R1_001.fastq.gz)"_2.fastq.gz \
                -O ${OUT}/"$(basename ${FQGZ} _R1_001.fastq.gz)"_umi2.fastq.gz \
                --umi --umi_loc=read2 --umi_len=8 -G -Q -A -L -w 1 -u 100 -n 8 -Y 100

	rm -rf fastp.*
done

