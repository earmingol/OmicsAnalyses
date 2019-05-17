#!/usr/bin/env bash

module load samtools
INPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/HW4/

for f in /home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/HW4/*.aligned.sam
do
    samtools view -S -b $f > ${f//.aligned.sam/.bam}
done