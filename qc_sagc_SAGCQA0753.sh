#!/bin/bash

#SBATCH --job-name=QC_transfer
#SBATCH --output=%x.%j.out

# Resources allocation request parameters
#SBATCH --partition=sahmri_prod_hpc

#SBATCH --mail-user=daniel.thomson@sahmri.com
#SBATCH --mail-type=FAIL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=6000       # this will request 96 Gb of memory
#SBATCH --time=1-00:00:00          # Run time in hh:mm:s

#set -e
#set -o pipefail

#/cancer/storage/SAGC/fastq/SAGCQA0826/AGRF_CAGRF23101271_22FMJWLT3

runID=AGRF_CAGRF23110187_22GWY7LT3
runName=SAGCQA0753-1_AlyceMartin
#baseDir=/cancer/storage/SAGC/fastq/$runName/$runID
baseDir=/cancer/storage/SAGC/projects/SAGCQA0753-1_AlyceMartin/AGRF_CAGRF23110187_22GWY7LT3/

# specify tools
multiqc='/apps/bioinfo/share/bcbio/anaconda/envs/sagc-run-qc/bin/multiqc'
fastqc='/apps/bioinfo/bin/FastQC/fastqc'
conda='/homes/daniel.thomson/bin/miniconda3/bin/activate'
condaEnv='/apps/bioinfo/SAGC_workflows/conda/SAGC-QC/prod'

#mkdir -p ${baseDir}/fastq
#mv ${baseDir}/*.fastq.gz ${baseDir}/fastq

## fastqc
mkdir -p ${baseDir}/fastqc

cd ${baseDir}/fastq.trimmed/
for input in $(ls *_L008_R*.fastq.gz) ; do
	${fastqc} $input ;
done

# multiqc
${multiqc} -b "daniel.thomson@sahmri.com" .

# checksum
md5sum *fastq.gz > md5sum.txt

# cleanup
#mv ${baseDir}/fastq/*fastqc* ${baseDir}/fastqc
#mv ${baseDir}/fastq/multiqc_* ${baseDir}/
#mv ${baseDir}/fastq/md5sum.txt ${baseDir}
#mv ${baseDir}/multiqc_report.html ${baseDir}/${runName}_MultiQC.html

# compress fastqs
#cd ${baseDir}/
#tar -czvf fastq.tar.gz fastq

# copy to cloudstor
#source ${conda} ${condaEnv}

#rclone copy --transfers 36 --progress --checksum --checkers 48 --timeout 0 ${baseDir} SAGC_CloudStor:/Shared/SAGC/${runName}/
##decompress with tar -xvf fastqs.tar.gz

