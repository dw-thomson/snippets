#!/bin/bash

#merging fasts from MGI run, Seans miRNA project
#SampleName_S1_L001_R1_001.fastq.gz


for input in $(grep SAGCFN_22 /sequencers/sequencers/mgi/MGI_SampleSheets/SampleSheet_SAGCQA0414-3-1-2_V350112391.csv | awk -F, '{print $1}') ; do cat /homes/daniel.thomson/projects/Sean_RNAseq/SAGCQA0414-3-1-2_sRNA/V350112391/fastq/L0*/${input}_S*_L0*_R1_001.fastq.gz > /homes/daniel.thomson/projects/Sean_RNAseq/SAGCQA0414-3-1-2_sRNA/V350112391/fastqs_merged/${input}_S1_L001_R1_001.fastq.gz ; done 
