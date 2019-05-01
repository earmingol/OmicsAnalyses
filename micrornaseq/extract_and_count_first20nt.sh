#!/bin/env bash

ROOT=/home/ucsd-train70/Erick/
DATA=/home/ucsd-train70/Erick/siob242c_work/micrornaseq/outputs/*.seq
OUTPUT=/home/ucsd-train70/Erick/siob242c_work/micrornaseq/outputs/

#Extract first 20 nt or microRNAs from sequences
for f in $DATA
do
    BASE=$(basename $f .seq)
    cut -b 1-20 $f | sort | uniq -c | sed 's/^ *//' | sed 's/ /	/' | sort -n -r > ${OUTPUT%%/}/"${BASE}.miRNA"
done
