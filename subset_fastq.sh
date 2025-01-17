#!/bin/bash

#SBATCH --job-name=subsetFastq
#SBATCH --mail-user=daniel.thomson@sahmri.com
#SBATCH --mail-type=FAIL
#SBATCH --output=subset.log

# Resources allocation request parameters
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --mem-per-cpu=6000       # this will request 96 Gb of memory
#SBATCH --time=3:00:00          # Run time in hh:mm:s

echo "begining"
cd /cancer/storage/SAGC/projects/SAGCQA0582_JustineSmith_mRNA/nfViralIntegration_subset
seqtk sample -s110 ../fastq.merged.renamed/3-RPE-UI_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-3-RPE-UI_S1_L001_R1_001.fastq.gz
seqtk sample -s110 ../fastq.merged.renamed/3-RPE-UI_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-3-RPE-UI_S1_L001_R2_001.fastq.gz

seqtk sample -s111 ../fastq.merged.renamed/3-RPE-ZIKV_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-3-RPE-ZIKV_S1_L001_R1_001.fastq.gz
seqtk sample -s111 ../fastq.merged.renamed/3-RPE-ZIKV_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-3-RPE-ZIKV_S1_L001_R2_001.fastq.gz

seqtk sample -s112 ../fastq.merged.renamed/4-RPE-EBOV_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-4-RPE-EBOV_S1_L001_R1_001.fastq.gz
seqtk sample -s112 ../fastq.merged.renamed/4-RPE-EBOV_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-4-RPE-EBOV_S1_L001_R2_001.fastq.gz

seqtk sample -s113 ../fastq.merged.renamed/4-RPE-RESV_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-4-RPE-RESV_S1_L001_R1_001.fastq.gz
seqtk sample -s113 ../fastq.merged.renamed/4-RPE-RESV_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-4-RPE-RESV_S1_L001_R2_001.fastq.gz

seqtk sample -s114 ../fastq.merged.renamed/4-RPE-UI_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-4-RPE-UI_S1_L001_R1_001.fastq.gz
seqtk sample -s114 ../fastq.merged.renamed/4-RPE-UI_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-4-RPE-UI_S1_L001_R2_001.fastq.gz

seqtk sample -s115 ../fastq.merged.renamed/4-RPE-ZIKV_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-4-RPE-ZIKV_S1_L001_R1_001.fastq.gz
seqtk sample -s115 ../fastq.merged.renamed/4-RPE-ZIKV_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-4-RPE-ZIKV_S1_L001_R2_001.fastq.gz

seqtk sample -s116 ../fastq.merged.renamed/5-RPE-EBOV_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-5-RPE-EBOV_S1_L001_R1_001.fastq.gz
seqtk sample -s116 ../fastq.merged.renamed/5-RPE-EBOV_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-5-RPE-EBOV_S1_L001_R2_001.fastq.gz

seqtk sample -s117 ../fastq.merged.renamed/5-RPE-RESV_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-5-RPE-RESV_S1_L001_R1_001.fastq.gz
seqtk sample -s117 ../fastq.merged.renamed/5-RPE-RESV_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-5-RPE-RESV_S1_L001_R2_001.fastq.gz

seqtk sample -s118 ../fastq.merged.renamed/5-RPE-UI_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-5-RPE-UI_S1_L001_R1_001.fastq.gz
seqtk sample -s118 ../fastq.merged.renamed/5-RPE-UI_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-5-RPE-UI_S1_L001_R2_001.fastq.gz

seqtk sample -s119 ../fastq.merged.renamed/5-RPE-ZIKV_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-5-RPE-ZIKV_S1_L001_R1_001.fastq.gz
seqtk sample -s119 ../fastq.merged.renamed/5-RPE-ZIKV_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-5-RPE-ZIKV_S1_L001_R2_001.fastq.gz

seqtk sample -s120 ../fastq.merged.renamed/6-RPE-EBOV_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-6-RPE-EBOV_S1_L001_R1_001.fastq.gz
seqtk sample -s120 ../fastq.merged.renamed/6-RPE-EBOV_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-6-RPE-EBOV_S1_L001_R2_001.fastq.gz

seqtk sample -s121 ../fastq.merged.renamed/6-RPE-RESV_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-6-RPE-RESV_S1_L001_R1_001.fastq.gz
seqtk sample -s121 ../fastq.merged.renamed/6-RPE-RESV_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-6-RPE-RESV_S1_L001_R2_001.fastq.gz

seqtk sample -s122 ../fastq.merged.renamed/6-RPE-UI_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-6-RPE-UI_S1_L001_R1_001.fastq.gz
seqtk sample -s122 ../fastq.merged.renamed/6-RPE-UI_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-6-RPE-UI_S1_L001_R2_001.fastq.gz

seqtk sample -s123 ../fastq.merged.renamed/6-RPE-ZIKV_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-6-RPE-ZIKV_S1_L001_R1_001.fastq.gz
seqtk sample -s123 ../fastq.merged.renamed/6-RPE-ZIKV_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-6-RPE-ZIKV_S1_L001_R2_001.fastq.gz

seqtk sample -s124 ../fastq.merged.renamed/7-RPE-EBOV_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-7-RPE-EBOV_S1_L001_R1_001.fastq.gz
seqtk sample -s124 ../fastq.merged.renamed/7-RPE-EBOV_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-7-RPE-EBOV_S1_L001_R2_001.fastq.gz

seqtk sample -s125 ../fastq.merged.renamed/7-RPE-RESV_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-7-RPE-RESV_S1_L001_R1_001.fastq.gz
seqtk sample -s125 ../fastq.merged.renamed/7-RPE-RESV_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-7-RPE-RESV_S1_L001_R2_001.fastq.gz

seqtk sample -s126 ../fastq.merged.renamed/7-RPE-UI_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-7-RPE-UI_S1_L001_R1_001.fastq.gz
seqtk sample -s126 ../fastq.merged.renamed/7-RPE-UI_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-7-RPE-UI_S1_L001_R2_001.fastq.gz

seqtk sample -s127 ../fastq.merged.renamed/7-RPE-ZIKV_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-7-RPE-ZIKV_S1_L001_R1_001.fastq.gz
seqtk sample -s127 ../fastq.merged.renamed/7-RPE-ZIKV_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-7-RPE-ZIKV_S1_L001_R2_001.fastq.gz

seqtk sample -s128 ../fastq.merged.renamed/ARPE-EBOV_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-ARPE-EBOV_S1_L001_R1_001.fastq.gz
seqtk sample -s128 ../fastq.merged.renamed/ARPE-EBOV_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-ARPE-EBOV_S1_L001_R2_001.fastq.gz

seqtk sample -s129 ../fastq.merged.renamed/ARPE-RESV_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-ARPE-RESV_S1_L001_R1_001.fastq.gz
seqtk sample -s129 ../fastq.merged.renamed/ARPE-RESV_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-ARPE-RESV_S1_L001_R2_001.fastq.gz

seqtk sample -s130 ../fastq.merged.renamed/ARPE-UI_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-ARPE-UI_S1_L001_R1_001.fastq.gz
seqtk sample -s130 ../fastq.merged.renamed/ARPE-UI_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-ARPE-UI_S1_L001_R2_001.fastq.gz

seqtk sample -s131 ../fastq.merged.renamed/ARPE-ZIKV_S1_L001_R1_001.fastq.gz 2000000 > fastq_subset20M/sub-ARPE-ZIKV_S1_L001_R1_001.fastq.gz
seqtk sample -s131 ../fastq.merged.renamed/ARPE-ZIKV_S1_L001_R2_001.fastq.gz 2000000 > fastq_subset20M/sub-ARPE-ZIKV_S1_L001_R2_001.fastq.gz

echo "finish"
