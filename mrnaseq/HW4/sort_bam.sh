#!/usr/bin/env bash

module load samtools

BAM_FILES=$1

for f in $BAM_FILES
do
    samtools sort $f ${f//.bam/.sorted.bam}
done

samtools markdup -r