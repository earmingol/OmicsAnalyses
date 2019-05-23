#!/usr/bin/env bash

module load samtools
INPUT=$1

for f in `echo ${INPUT}"/*.aligned.sam"`
do
    samtools view -S -b $f > ${f//.aligned.sam/.bam}
done