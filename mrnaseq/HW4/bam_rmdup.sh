#!/usr/bin/env bash

module load samtools

INPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/HW4/

for f in /home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/HW4/*.sorted.bam
do
    samtools rmdup -s $f ${f//.bam/.dedup.bam}
done

