#!/bin/bash

#SBATCH --job-name=fastqc_multqc_tar
#SBATCH --output=tar.log

#set -e
#set -o pipefail


# backup pipeline, relying on fastq generation on basespace, bs download

baseDir=/cancer/storage/SAGC/miseq_Flinders/SAGCQA0709_MichaelDoane_project

# fastqc
mkdir -p ${baseDir}/fastq
cd ${baseDir}/fastq/
mkdir -p ${baseDir}/fastqc

for input in $(ls *.fastq.gz) ; do
	/apps/bioinfo/bin/FastQC/fastqc $input ;
done

#multiqc
/apps/bioinfo/share/bcbio/anaconda/envs/sagc-run-qc/bin/multiqc .

#checksum
md5sum * > md5sum.txt

mv ${baseDir}/fastq/*fastqc* ${baseDir}/fasqtc
mv multiqc_* ${baseDir}/

###

echo "taring"
cd ${baseDir}/

tar -czvf fastq.tar.gz fastq
md5sum fastq.tar.gz > fastq.tar.gz.md5sum.txt


#conda activate /apps/bioinfo/SAGC_workflows/conda/SAGC-QC/prod
rclone copy --transfers 36 --progress --checksum --checkers 48 --timeout 0 SAGCQA0709_MichaelDoane_project SAGC_CloudStor:/Shared/SAGC/SAGCQA0709_MichaelDoane/230801_M02873_0153_000000000-L6FF3/
echo "finished"
##decompress with tar -xvf fastqs.tar.gz
