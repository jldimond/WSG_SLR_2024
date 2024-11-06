#!/bin/bash

BASEDIR=/Users/molecularlab/Documents/WSG-SLR_2024/Katharina
DATA=$BASEDIR/data/bam/Cleaned_bam
REF=$BASEDIR/ref_genome/ncbi_dataset/data/GCA_032466195.1/GCA_032466195.1_ASM3246619v1_genomic.fna
ANGSD=~/angsd/angsd
SAMTOOLS=~/local/bin/samtools

cd $BASEDIR
$ANGSD -b $BASEDIR/bamlists/kath_bams.list -ref $REF -out $BASEDIR/results/angsd/kath_all \
        -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 \
        -minMapQ 20 -minQ 20 -minInd 30 -doCounts 1 -GL 2 -doGlf 2 -nThreads 6 \
        -doMajorMinor 1 -SNP_pval 1e-6 -doMaf 1 -doIBS 1 -makeMatrix 1 -doCov 1