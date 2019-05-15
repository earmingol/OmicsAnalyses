#!/usr/bin/env bash

module load samtools

BAM_FILES=$1

for f in $BAM_FILES
do
    samtools markdup -r $f ${f//.bam/.dedup.bam}
done

