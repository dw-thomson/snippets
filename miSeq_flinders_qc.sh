#!/bin/bash

#SBATCH --job-name=miSeq_flinders
#SBATCH --output=miSeq_flinders.log

#set -e
#set -o pipefail

############### miSeq_flinders_qc.sh ################
## pipeline to get demultiplexed fastqs from Flinders BaseSpace, QC and transfer to Cloudstor
## written as alternative to nf-core-SAGC, for Flinders miSeq
################ to run with slurm ##################

# sbatch miSeq_flinders_qc.sh 'runID' 'runName'

# find basespace runID and runName
# bs list projects
# to setup baseSpace-CLI see /cancer/storage/SAGC/SOP_READMEs_SAGC/README_miSeq_Flinders_qc.md
# /cancer/storage/SAGC/SOP_READMEs_SAGC/README.BaseSpaceSetup.md

################ quick description ##################
# input: the script just needs the basespace ID ($1) and runName ($2)
# log: the log will be printed where the script is launched,
# output: /cancer/storage/SAGC/miseq_Flinders/${runName}
# - fastq/
# - fastqc/
# - multiqc/
# - fastq.tar.gz
# - md5checksums
# data transfer: copied to SAGC cloudstor, as ${runName}
#####################################################

runID="$1"
runName="$2"

echo "run name = " ${runName}
echo "run ID = " ${runID}

baseDir=/cancer/storage/SAGC/miseq_Flinders/$runName
echo "baseDir= "${baseDir}

# specify tools
multiqc=/apps/bioinfo/share/bcbio/anaconda/envs/sagc-run-qc/bin/multiqc
fastqc=/apps/bioinfo/bin/FastQC/fastqc

# download data
mkdir -p ${baseDir}/bs_project
bs download project -i ${runID} -o ${baseDir}/bs_project

mkdir -p ${baseDir}/fastq
mv ${baseDir}/bs_project/*/*.fastq.gz ${baseDir}/fastq

## fastqc
mkdir -p ${baseDir}/fastqc

cd ${baseDir}/fastq/
for input in $(ls *.fastq.gz) ; do
	${fastqc} $input ;
done

# multiqc
${multiqc} .

# checksum
md5sum *fastq.gz > md5sum.txt

mv ${baseDir}/fastq/*fastqc* ${baseDir}/fastqc
mv multiqc_* ${baseDir}/
mv ${baseDir}/fastq/md5sum.txt ${baseDir}

# compress fastqs

cd ${baseDir}/
tar -czvf fastq.tar.gz fastq

conda activate /apps/bioinfo/SAGC_workflows/conda/SAGC-QC/prod

rclone copy --transfers 36 --progress --checksum --checkers 48 --timeout 0 ${baseDir} SAGC_CloudStor:/Shared/SAGC/${runName}/
echo "finished"

##decompress with tar -xvf fastqs.tar.gz
