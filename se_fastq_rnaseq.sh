#!/bin/bash

#SBATCH --job-name=star
#SBATCH --mail-user=daniel.thomson@sahmri.com
#SBATCH --mail-type=FAIL
#SBATCH --output=align.log

# Resources allocation request parameters
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=6000       # this will request 96 Gb of memory
#SBATCH --time=100:00:00          # Run time in hh:mm:s

#DT adapted from JB

# Run fastqc and STAR alignment - then quantification

cpu=16
genome="mm10"
base=`pwd`
data=${base}/fastqs

STARindexDir=/apps/bioinfo/share/bcbio/genomes/Mmusculus/mm10/star
annotation_file=/apps/bioinfo/share/bcbio/genomes/Mmusculus/mm10/rnaseq/ref-transcripts.gtf
STAR=/apps/bioinfo/local/bin/STAR
featureCounts=/apps/bioinfo/local/bin/featureCounts
fastqc=/apps/bioinfo/local/bin/fastqc
#AdapterRemoval=/homes/jimmy.breen/bin/AdapterRemoval # wasn't there
AdapterRemoval=/apps/bioinfo/bin/AdapterRemoval

for i in ${data}/*1.fastq.gz; do

	# Run fastqc
	mkdir -p ${base}/0_qc
	${fastqc} -o ${base}/0_qc/ $i

	# Trim with AdapterRemoval
	mkdir -p ${base}/1_AdapterRemoval
	${AdapterRemoval} --file1 $i --gzip --output1 ${base}/1_AdapterRemoval/`basename $i 1.fastq.gz`_tr1.fastq.gz

	# Run fastqc
        mkdir -p ${base}/1a_trimQC
        ${fastqc} -o ${base}/1a_trimQC ${base}/1_AdapterRemoval/`basename $i 1.fastq.gz`_tr1.fastq.gz

	# Align data
	mkdir -p ${base}/2_star
	${STAR} --genomeDir ${STARindexDir} \
		--readFilesIn ${base}/1_AdapterRemoval/`basename $i 1.fastq.gz`_tr1.fastq.gz \
		--readFilesCommand zcat \
		--outFilterType BySJout \
		--alignSJoverhangMin 8 \
		--alignSJDBoverhangMin 1 \
		--outFilterMismatchNmax 999 \
		--outSAMtype BAM SortedByCoordinate \
		--outFileNamePrefix ${base}/2_star/`basename $i 1.fastq.gz`_${genome}_ \
		--outSAMattrRGline ID:${sample_name} LB:library PL:illumina PU:machine SM:${genome} \
		--twopassMode Basic \
		--outSAMmapqUnique 60 \
		--runThreadN ${cpu}
done

# FeatureCounts
mkdir -p ${base}/3_counts
${featureCounts} -a ${annotation_file} \
        -T ${cpu} \
	-s 1 \
	-o ${base}/3_counts/project_allBams_${genome}.geneCounts.tsv \
        ${base}/1_star/*_Aligned.sortedByCoord.out.bam \
        > ${base}/3_counts/${sample_name}.featureCounts.log

cut -f1,7- ${base}/3_counts/project_allBams_${genome}.geneCounts.tsv > ${base}/3_counts/countTable.tsv




