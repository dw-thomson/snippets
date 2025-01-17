#!/bin/bash

#SBATCH --job-name=SpaceRanger_23-01898
#SBATCH --mail-user=daniel.thomson@sahmri.com
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --output=SLURM.log

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=32G
#SBATCH --time=12:15:25

spaceranger=/apps/bioinfo/bin/spaceranger-2.0.0/bin/spaceranger

${spaceranger} count --id=SAGCQA0810_23-01898 \
 --transcriptome=/homes/cathal.king/yard/cell_r_metrics/refdata-gex-GRCh38-2020-A/ \
 --probe-set=/homes/cathal.king/SAGC/Visium_Cyt_Assist/Visium_Human_Transcriptome_Probe_Set_v2.0_GRCh38-2020-A.csv \
 --fastqs=/cancer/storage/SAGC/projects/SAGCQA0810_spaceranger/230922_M02873_0162_000000000-GJ89N/SAGCQA0810_GuillermoGomez_22092023/fastq/ \
 --sample=23-01898 \
 --cytaimage=/cancer/storage/SAGC/projects/SAGCQA0810_spaceranger/SAGCQA0810/CAVG10021_2023-09-20_11-34-11_2023-09-20_11-10-28_V53F21-102_A_bt106.tif \
 --slide=V53F21-102 \
 --area=A \
 --localcores=32 \
 --localmem=128
 --no-bam \
 --loupe-alignment /cancer/storage/SAGC/projects/SAGCQA0810_spaceranger/SAGCQA0810/V53F21-102-A1.json
