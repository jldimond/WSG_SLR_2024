#!/bin/bash

BASEDIR=/Users/molecularlab/Documents/WSG-SLR_2024/Katharina
RAWDATA=$BASEDIR/data/fastq
TRIMMED=$BASEDIR/data/fastq/cleaned_fastq


for f1 in *_R1_001.fastq.gz
do
        f2=${f1%%_R1_001.fastq.gz}"_R2_001.fastq.gz"
        fastp -i $RAWDATA/$f1 -I $RAWDATA/$f2 -o $TRIMMED/"trimmed-$f1" -O $TRIMMED/"trimmed-$f2" --thread 7
done