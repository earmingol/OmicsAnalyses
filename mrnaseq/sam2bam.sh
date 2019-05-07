#!/usr/bin/env bash

module load samtools

for f in /home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/*.aligned.sam
do
    BASE=$(basename -- $f)
    PATH=$(dirname $f)
    samtools view -bS $f > ${f//.aligned.sam/.bam}
done