#!/usr/bin/env bash

module load samtools

INPUT=$1

for f in `echo ${INPUT}"/*.bam"`
do
    samtools sort $f > ${f//.bam/.sorted.bam}
done