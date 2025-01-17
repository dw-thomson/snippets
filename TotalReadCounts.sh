#!/bin/bash

# a quick script for pulling out total readcount from fastqcs
# For miSeq runs where we want to give back the exact read counts, but fastqc/multqc reports M Seqs and they are rounded down in the report

# specifiy input
project=SAGCQA0829
run=231011_M02873_0164_000000000-L84BH
subdir=SAGCQA0829_MiriamLynn_11102023

# get readcounts from raw fastqc data,

cd /cancer/storage/SAGC/fastq/${project}/${run}/${subdir}/QC-results/fastqc

for input in  *_fastqc.zip ; do unzip $input ; done

for input in  *_fastqc ; do grep "Total\ Sequences" $input/fastqc_data.txt ; done | awk  '{print $3}'  > total.sequences.temp.txt

for input in  *_fastqc ; do ls -d $input | awk -F _ '{print $1"_"$2}' ; done > names.temp.txt

paste names.temp.txt total.sequences.temp.txt | sed 's/\t/,/g'  > ${project}_total.read.counts.csv

conda activate /apps/bioinfo/SAGC_workflows/conda/SAGC-QC/prod

# copies ${project}_total.read.counts.csv to cloudstor

rclone copy --transfers 36 --progress --checksum --checkers 48 --timeout 0 ${project}_total.read.counts.csv  SAGC_CloudStor:/Shared/SAGC/${project}/${run}/${subdir}/QC-results/

rm total.sequences.temp.txt  names.temp.txt

rm -r *_R1_fastqc
