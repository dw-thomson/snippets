#!/bin/bash

#SBATCH --job-name=subsetFastq1
#SBATCH --mail-user=daniel.thomson@sahmri.com
#SBATCH --mail-type=FAIL
#SBATCH --output=subset1.log

# Resources allocation request parameters
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
#SBATCH --mem-per-cpu=6000       # this will request 96 Gb of memory
#SBATCH --time=3:00:00          # Run time in hh:mm:s

##the 'seed -s' needs to be the same for pairs, and different for other pairs.

echo "begining"

#seqtk sample -s110 23-00586_R1.fastq 60000000 > subset/23-00586_R1.fastq
#seqtk sample -s110 23-00586_R2.fastq  60000000 > subset/23-00586_R2.fastq

seqtk sample -s111 23-00586_S1_R1_001.fastq 60000000 > subset/23-00586_S1_R1_001.fastq
seqtk sample -s111 23-00586_S1_R2_001.fastq 60000000 > subset/23-00586_S1_R2_001.fastq

#seqtk sample -s112 23-00587_R1.fastq 60000000 > subset/23-00587_R1.fastq
#seqtk sample -s112 23-00587_R2.fastq 60000000 > subset/23-00587_R2.fastq

#seqtk sample -s113 23-00587_S2_R1_001.fastq 60000000 > subset/23-00587_S2_R1_001.fastq
#seqtk sample -s113 23-00587_S2_R2_001.fastq 60000000 > subset/23-00587_S2_R2_001.fastq

#seqtk sample -s114 23-00588_R1.fastq 60000000 > subset/23-00588_R1.fastq
#seqtk sample -s114 23-00588_R2.fastq 60000000 > subset/23-00588_R2.fastq

#seqtk sample -s115 23-00588_S3_R1_001.fastq 60000000 > subset/23-00588_S3_R1_001.fastq
#seqtk sample -s115 23-00588_S3_R2_001.fastq 60000000 > subset/23-00588_S3_R2_001.fastq

#seqtk sample -s116 23-00589_R1.fastq 60000000 > subset/23-00589_R1.fastq
#seqtk sample -s116 23-00589_R2.fastq 60000000 > subset/23-00589_R2.fastq

#seqtk sample -s117 23-00589_S4_R1_001.fastq 60000000 > subset/23-00589_S4_R1_001.fastq
#seqtk sample -s117 23-00589_S4_R2_001.fastq 60000000 > subset/23-00589_S4_R2_001.fastq

#seqtk sample -s118 23-00590_R1.fastq 60000000 > subset/23-00590_R1.fastq
#seqtk sample -s118 23-00590_R2.fastq 60000000 > subset/23-00590_R2.fastq

#seqtk sample -s119 23-00590_S5_R1_001.fastq 60000000 > subset/23-00590_S5_R1_001.fastq
#seqtk sample -s119 23-00590_S5_R2_001.fastq 60000000 > subset/23-00590_S5_R2_001.fastq

#seqtk sample -s120 23-00591_R1.fastq 60000000 > subset/23-00591_R1.fastq
#seqtk sample -s120 23-00591_R2.fastq 60000000 > subset/23-00591_R2.fastq

#seqtk sample -s121 23-00591_S6_R1_001.fastq 60000000 > subset/23-00591_S6_R1_001.fastq
#seqtk sample -s121 23-00591_S6_R2_001.fastq 60000000 > subset/23-00591_S6_R2_001.fastq

#seqtk sample -s122 23-00592_R1.fastq 60000000 > subset/23-00592_R1.fastq
#seqtk sample -s122 23-00592_R2.fastq 60000000 > subset/23-00592_R2.fastq

#seqtk sample -s123 23-00592_S7_R1_001.fastq 60000000 > subset/23-00592_S7_R1_001.fastq
#seqtk sample -s123 23-00592_S7_R2_001.fastq 60000000 > subset/23-00592_S7_R2_001.fastq


echo "finish"
