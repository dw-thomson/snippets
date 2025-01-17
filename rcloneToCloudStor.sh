#!/bin/bash

#SBATCH --job-name=rclone
#SBATCH --output=rclone.log

#set -e
#set -o pipefail

echo "taring"

#conda activate /apps/bioinfo/SAGC_workflows/conda/SAGC-QC/prod

rclone copy --transfers 36 --progress --checksum --checkers 48 --timeout 0 /cancer/storage/SAGC/fastq/SAGCQA0594_PeterPsaltis_AGRF/fastqs.tar.gz SAGC_CloudStor:Shared/SAGC/SAGCQA0594_PeterPsaltis/AGRF_CAGRF230414303_HFGYHDRX3/

echo "finished"
