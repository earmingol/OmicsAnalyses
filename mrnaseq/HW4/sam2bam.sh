#!/usr/bin/env bash

module load samtools

SAM_FILES=$1

for f in $SAM_FILES
do
    samtools view -S -b $f > ${f//.aligned.sam/.bam}
done