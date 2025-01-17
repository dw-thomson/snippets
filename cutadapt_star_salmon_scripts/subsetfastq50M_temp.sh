#!/bin/bash

#SBATCH --job-name=subsample50
#SBATCH --output=sub50.%x.%j.out

# Resources allocation request parameters
#SBATCH --mail-user=daniel.thomson@sahmri.com
#SBATCH --mail-type=FAIL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem-per-cpu=6000       # this will request 96 Gb of memory
#SBATCH --time=1-00:00:00          # Run time in hh:mm:s

#set -e
#set -o pipefail


cd /cancer/storage/SAGC/projects/SAGCQA0888/fastq.renamed/fastp/subset_20mil

#zcat ../MM142_S1_L001_R1_001.fastq.gz > MM142_S1_L001_R1_001.fastq
#zcat ../MM142_S1_L001_R2_001.fastq.gz > MM142_S1_L001_R2_001.fastq
#zcat ../MM143_S1_L001_R1_001.fastq.gz > MM143_S1_L001_R1_001.fastq
#zcat ../MM143_S1_L001_R2_001.fastq.gz > MM143_S1_L001_R2_001.fastq
#zcat ../MM144_S1_L001_R1_001.fastq.gz > MM144_S1_L001_R1_001.fastq
#zcat ../MM144_S1_L001_R2_001.fastq.gz > MM144_S1_L001_R2_001.fastq
#zcat ../MM145_S1_L001_R1_001.fastq.gz > MM145_S1_L001_R1_001.fastq
#zcat ../MM145_S1_L001_R2_001.fastq.gz > MM145_S1_L001_R2_001.fastq



#R1=$1
#R2=$2

#number of reads
#depth=20000000

#Subsampling paired-end reads (FASTQ):


paste MM142_S1_L001_R1_001.fastq MM142_S1_L001_R2_001.fastq | awk '{ printf("%s",$0); n++; if(n%4==0) { printf("\n");} else { printf("\t");} }' | \
awk -v k=50000000 'BEGIN{srand(systime() + PROCINFO["pid"]);}{s=x++<k?x1:int(rand()*x);if(s<k)R[s]=$0}END{for(i in R)print R[i]}' | \
awk -F "\t" '{print $1"\n"$3"\n"$5"\n"$7 > "MM142sub50_S1_L001_R1_001.fastq" ; print $2"\n"$4"\n"$6"\n"$8 > "MM142sub50_S1_L001_R2_001.fastq"}'

paste MM143_S1_L001_R1_001.fastq MM143_S1_L001_R2_001.fastq | awk '{ printf("%s",$0); n++; if(n%4==0) { printf("\n");} else { printf("\t");} }' | \
awk -v k=50000000 'BEGIN{srand(systime() + PROCINFO["pid"]);}{s=x++<k?x1:int(rand()*x);if(s<k)R[s]=$0}END{for(i in R)print R[i]}' | \
awk -F "\t" '{print $1"\n"$3"\n"$5"\n"$7 > "MM143sub50_S1_L001_R1_001.fastq" ; print $2"\n"$4"\n"$6"\n"$8 > "MM143sub50_S1_L001_R2_001.fastq"}'

paste MM144_S1_L001_R1_001.fastq MM144_S1_L001_R2_001.fastq | awk '{ printf("%s",$0); n++; if(n%4==0) { printf("\n");} else { printf("\t");} }' | \
awk -v k=50000000 'BEGIN{srand(systime() + PROCINFO["pid"]);}{s=x++<k?x1:int(rand()*x);if(s<k)R[s]=$0}END{for(i in R)print R[i]}' | \
awk -F "\t" '{print $1"\n"$3"\n"$5"\n"$7 > "MM144sub50_S1_L001_R1_001.fastq" ; print $2"\n"$4"\n"$6"\n"$8 > "MM144sub50_S1_L001_R2_001.fastq"}'

paste MM145_S1_L001_R1_001.fastq MM145_S1_L001_R2_001.fastq | awk '{ printf("%s",$0); n++; if(n%4==0) { printf("\n");} else { printf("\t");} }' | \
awk -v k=50000000 'BEGIN{srand(systime() + PROCINFO["pid"]);}{s=x++<k?x1:int(rand()*x);if(s<k)R[s]=$0}END{for(i in R)print R[i]}' | \
awk -F "\t" '{print $1"\n"$3"\n"$5"\n"$7 > "MM145sub50_S1_L001_R1_001.fastq" ; print $2"\n"$4"\n"$6"\n"$8 > "MM145sub50_S1_L001_R2_001.fastq"}'

paste MM135_S1_L001_R1_001.fastq MM135_S1_L001_R2_001.fastq | awk '{ printf("%s",$0); n++; if(n%4==0) { printf("\n");} else { printf("\t");} }' | \
awk -v k=50000000 'BEGIN{srand(systime() + PROCINFO["pid"]);}{s=x++<k?x1:int(rand()*x);if(s<k)R[s]=$0}END{for(i in R)print R[i]}' | \
awk -F "\t" '{print $1"\n"$3"\n"$5"\n"$7 > "MM135sub50_S1_L001_R1_001.fastq" ; print $2"\n"$4"\n"$6"\n"$8 > "MM135sub50_S1_L001_R2_001.fastq"}'

paste K10R_S1_L001_R1_001.fastq K10R_S1_L001_R2_001.fastq | awk '{ printf("%s",$0); n++; if(n%4==0) { printf("\n");} else { printf("\t");} }' | \
awk -v k=50000000 'BEGIN{srand(systime() + PROCINFO["pid"]);}{s=x++<k?x1:int(rand()*x);if(s<k)R[s]=$0}END{for(i in R)print R[i]}' | \
awk -F "\t" '{print $1"\n"$3"\n"$5"\n"$7 > "K10Rsub50_S1_L001_R1_001.fastq" ; print $2"\n"$4"\n"$6"\n"$8 > "K10Rsub50_S1_L001_R2_001.fastq"}'


echo "done"










