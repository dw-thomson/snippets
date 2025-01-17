#!/bin/bash

#SBATCH --job-name=Salmon
#SBATCH --array=1-6
#SBATCH --output=01-Salmon.%a.out

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



##DT
# Salmon was installed via conda - RNAseq environment
# conda install -n RNAseq salmon
# conda activate RNAseq
# index location /homes/daniel.thomson/References/GRCh38/Salmon/GRCh38_salmon_index

###kickoff###
#conda activate RNAseq

BaseDir='/cancer/storage/SAGC/projects/SAGCQA0888'
cd ${BaseDir}
mkdir -p ${BaseDir}/Salmon/

#ls star/*star_outs/*bam | awk -F / '{print $NF}'

declare -A DATA
DATA[1]='K10R'
DATA[2]='MM135'
DATA[3]='MM142'
DATA[4]='MM143'
DATA[5]='MM144'
DATA[6]='MM145'

#_Aligned.sortedByCoord.out.bam

echo "running salmon"

salmon quant \
	-t /homes/daniel.thomson/References/GRCh38/Salmon/ncbi_dataset/data/GCF_000001405.40/rna.fna \
        -l A \
        -a ${baseDir}/star/*/${DATA[$SLURM_ARRAY_TASK_ID]} \
        -o ${BaseDir}/Salmon/${DATA[$SLURM_ARRAY_TASK_ID]}

#make bamlist first then loop salmon function from that
#cd ${BaseDir}
#ls star/*star_outs/*bam | awk -F / '{print $NF}' > star/bamlist.txt

#for BamFile in $(cat star/bamlist.txt) 
#do sbatch ;
#echo $input ;done

##############

#echo "running salmon"

#BamFileDir=$1
#BamFile='ls ${BamFileDir} | xargs basename'
#samplePrefix=${BamFile/_Aligned.sortedByCoord.out.bam/_}
#bamDir=/cancer/storage/SAGC/projects/SAGCQA0888/star/${samplePrefix}star_outs/
#outDir='/cancer/storage/SAGC/projects/SAGCQA0888/salmon'
#mkdir -p ${outDir}

#echo "bam file = " ${bamDir}${BamFile}
#echo "samplePrefix =" ${samplePrefix}

#cd ${outDir}
#mkdir -p ${samplePrefix}star_outs
#cd ${samplePrefix}star_outs

#salmon quant \
#	-t /homes/daniel.thomson/References/GRCh38/Salmon/ncbi_dataset/data/GCF_000001405.40/rna.fna \
#	-l A \
#	-a ${bamDir}/${BamFile} \
#	-o ${samplePrefix}salmon_quant

echo "################## finished #####################"
