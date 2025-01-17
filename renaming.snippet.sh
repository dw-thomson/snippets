#!/bin/bash

BaseDir='/cancer/storage/SAGC/shared/ALL_fastqs/SAGCQA0625-1/F350010030'
SampleSheet=${BaseDir}/SampleSheet*

#get ULNs and Sample Names from samplesheet
awk -F , '{print "["$1"]="$2}' ${SampleSheet} |  grep 23-

# Map ULNs to Sample Names - for symlink name prefixes
declare -A ULNS=(
[23-00586]=AYA-1014-202132
[23-00587]=A9417-383087
[23-00588]=AYA-1016-202144
[23-00589]=AYA-1017-202075
[23-00590]=CHI-1018-202049
[23-00591]=NALM-6
[23-00592]=SAGC_Negative
)

# softlink FASTQs - MGI run
mkdir -p ${BaseDir}/fastq.renamed

for uln in "${!ULNS[@]}"; do
  sample_name="${ULNS[${uln}]}"
  echo "${uln} => ${sample_name}"

ln -s ${BaseDir}/fastq/${uln}*R1*fastq.gz  ${BaseDir}/fastq.renamed/${sample_name}_S1_L001_R1_001.fastq.gz
ln -s ${BaseDir}/fastq/${uln}*R2*fastq.gz  ${BaseDir}/fastq.renamed/${sample_name}_S1_L001_R2_001.fastq.gz

done
