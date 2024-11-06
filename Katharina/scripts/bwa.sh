#!/bin/bash

BASEDIR=/Users/molecularlab/Documents/WSG-SLR_2024/Katharina
RAWDATA=$BASEDIR/data/fastq/
TRIMMED=$BASEDIR/data/fastq/cleaned_fastq
BAM=$BASEDIR/data/bam
REF=$BASEDIR/ref_genome/ncbi_dataset/data/GCA_032466195.1/GCA_032466195.1_ASM3246619v1_genomic.fna


for i in $(ls -1 *R1_001.fastq.gz | sed 's/\R1_001.fastq.gz//') 
do bwa mem -t 3 $REF $i\R1_001.fastq.gz $i\R2_001.fastq.gz | samtools view -Sb - | samtools sort -@ 3 -o $BAM/$i\.bam - 
done

#for f1 in *_R1_001.fastq.gz
#do
#        f2=${f1%%_R1_001.fastq.gz}"_R2_001.fastq.gz"
#        bwa mem -t 3 $REF $TRIMMED/$f1 $TRIMMED/$f2 | samtools view -Sb - | samtools sort -@ 3 -o $BAM/$i\.bam - 
#done