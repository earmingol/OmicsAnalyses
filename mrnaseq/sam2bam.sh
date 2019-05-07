#!/usr/bin/env bash

module load samtools

for f in "$@"
do
    BASE=$(basename -- $f)
    PATH=$(dirname $f)
    samtools view -bS $PATH$BASE > $PATH${BASE//.sam/.bam}
done