#!/bin/bash

BASEDIR=/Users/molecularlab/Documents/WSG-SLR_2024/Katharina
BAMUTIL=/opt/miniconda3/envs/jdenv/bin/bam
BAMS=$BASEDIR/data/bam
BAMLIST=$BASEDIR/bamlists/Katharina_bamlist.txt
OUTDIR=$BASEDIR/data/bam/Cleaned_bam

## Loop over each sample
for f1 in `cat $BAMLIST`; do

    ## Clip overlapping paired end reads (only necessary for paired-end data)
    bam clipOverlap --in $OUTDIR/"dedup-$f1" --out $OUTDIR/"clipped-$f1" --stats

done