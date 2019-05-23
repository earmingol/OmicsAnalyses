#!/usr/bin/env bash

module load samtools

INPUT=$1

for f in `echo ${INPUT}"/*.sorted.bam"`
do
    samtools rmdup -s $f ${f//.bam/.dedup.bam}
done

