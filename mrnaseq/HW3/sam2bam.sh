#!/usr/bin/env bash

module load samtools

for f in /home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/*.aligned.sam
do
    samtools view -S -b $f > ${f//.aligned.sam/.bam}
done