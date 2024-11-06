#!/bin/bash

BASEDIR=/Users/molecularlab/Documents/WSG-SLR_2024/Katharina
PICARD=/opt/miniconda3/envs/jdenv/bin/picard
BAMUTIL=/opt/miniconda3/envs/jdenv/bin/bam
BAMS=$BASEDIR/data/bam
BAMLIST=$BASEDIR/bamlists/Katharina_bamlist.txt
OUTDIR=$BASEDIR/data/bam/Cleaned_bam

## Loop over each sample
for f1 in `cat $BAMLIST`; do
    
    ## Remove duplicates and print dupstat file
    picard MarkDuplicates -Xmx8g I=$BAMS/$f1 O=$OUTDIR/"dedup-$f1" M=$OUTDIR/'dupstat.txt' REMOVE_DUPLICATES=true

done