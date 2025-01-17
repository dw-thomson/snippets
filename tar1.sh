#!/bin/bash

#SBATCH --job-name=tar
#SBATCH --output=tar.log

#set -e
#set -o pipefail

echo "taring"
cd /cancer/storage/SAGC/fastq/SAGCQA0710/F350014215

#tar -czvf fastq_1of3.tar.gz fastq_1of3
tar -czvf fastq_2of3.tar.gz fastq_2of3
tar -czvf fastq_3of3.tar.gz fastq_3of3

#conda activate /apps/bioinfo/SAGC_workflows/conda/SAGC-QC/prod
#rclone copy --transfers 36 --progress --checksum --checkers 48 --timeout 0 cutadapt.tar.gz SAGC_CloudStor:Shared/SAGC/SAGCQA0599/F350010001/cutadapt.tar.gz
#rclone copy --transfers 36 --progress --checksum --checkers 48 --timeout 0 fastq.tar.gz SAGC_CloudStor:/Shared/SAGC/SAGCQA0720/230803_M02873_0154_000000000-L64W2/SAGCQA0720_JeanWinter/fastq
#rclone copy --transfers 36 --progress --checksum --checkers 48 --timeout 0 fastq.tar.gz.md5sum.txt SAGC_CloudStor:/Shared/SAGC/SAGCQA0720/230803_M02873_0154_000000000-L64W2/SAGCQA0720_JeanWinter
echo "finished"
##decompress with tar -xvf fastqs.tar.gz

