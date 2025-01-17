#!/bin/bash

#SBATCH --job-name=Cleanup
#SBATCH --output=Cleanup.log

#set -e
#set -o pipefail

cd /cancer/storage/SAGC/projects

#find . -maxdepth 3 -user daniel.thomson -type d -name work

rm -r ./SAGCQA0414-SeanMullany-mRNA/nfDifferentialAbundance3/work
echo "deletion complete"
rm -r ./SAGCQA0414-SeanMullany-mRNA/nfDifferentialAbundance2/work
echo "deletion complete"
rm -r ./SAGCQA0928_AshleyMeakin_02042024_sRNA/nfDifferentialAbundance_mir/work
echo "deletion complete"
rm -r ./SAGCQA0928_AshleyMeakin_02042024_sRNA/nf-RNAseq-mir/work
echo "deletion complete"
rm -r ./SAGCQA0928_AshleyMeakin_02042024_sRNA/nf-RNAseq/work
echo "deletion complete"
rm -r ./SAGCQA0928_AshleyMeakin_02042024_sRNA/nf-smRNAseq-BosTaurus-umi/work
echo "deletion complete"
rm -r ./SAGCQA0928_AshleyMeakin_02042024_sRNA/nfDifferentialAbundance/work
echo "deletion complete"
rm -r ./SAGCQA0928_AshleyMeakin_02042024_sRNA/nf-smRNAseq-Oar/work
echo "deletion complete"
rm -r ./SAGCQA0928_AshleyMeakin_02042024_sRNA/nf-smRNAseq-Ramb/work
echo "deletion complete"
rm -r ./SAGCQA0583_JustineSmith_sRNA/nfRNAseq_ZaireEbolavirus_sRNA/work
echo "deletion complete"
rm -r ./SAGCQA0583_JustineSmith_sRNA/nf-smRNAseq/work
echo "deletion complete"
rm -r ./SAGCQA0583_JustineSmith_sRNA/nfDA_smRNA_test/work
echo "deletion complete"
rm -r ./SAGCQA0690_HayleyParkinson_09062023_DAnalysis/nfDifferentialAbundance_GRCh38_Ensembl/work
echo "deletion complete"
rm -r ./SAGCQA0690_HayleyParkinson_09062023_DAnalysis/nfDifferentialAbundance_GRCh38/work
echo "deletion complete"
rm -r ./SAGCQA0450-NoorLockman-RNA/nfRNAseq/work
echo "deletion complete"
rm -r ./SAGCQA0450-NoorLockman-RNA/nfDifferentialAbundance_live/work
echo "deletion complete"
rm -r ./SAGCQA0450-NoorLockman-RNA/nfDifferentialAbundance_shared/work
echo "deletion complete"
rm -r ./SAGCQA0160-AnmolSaini-DT/nf-sarek-test/work
echo "deletion complete"
rm -r ./SAGCQA0160-AnmolSaini-DT/nf-sarek-cnv/work
echo "deletion complete"
rm -r ./SAGCQA0160-AnmolSaini-DT/fastq.renamed/work
echo "deletion complete"
rm -r ./SAGCQA0582_JustineSmith_mRNA/nfDifferentialAbundance_ZaireEbolavirus/work
echo "deletion complete"
rm -r ./SAGCQA0582_JustineSmith_mRNA/nfRNAseq_ZaireEbolavirus/work
echo "deletion complete"
rm -r ./SAGCQA0582_JustineSmith_mRNA/nfMAG_removehost/work
echo "deletion complete"
rm -r ./SAGCQA0888/nf-core_RNAseq/work
echo "deletion complete"
rm -r ./SAGCQA0823-TinaBiaco-Miotto/nfDifferentialAbundance_Rnor_wrongcontrasts/work
echo "deletion complete"
rm -r ./SAGCQA0823-TinaBiaco-Miotto/nfRNAseq_Rnor/work
echo "deletion complete"

echo "fininshed"
