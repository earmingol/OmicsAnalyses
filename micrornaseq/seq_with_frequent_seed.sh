#!/bin/env bash

ROOT=/home/ucsd-train70/Erick/
DATA=/home/ucsd-train70/Erick/siob242c_work/micrornaseq/outputs/*.seq
OUTPUT=/home/ucsd-train70/Erick/siob242c_work/micrornaseq/outputs/

#Get sequences with the most frequent seed
for f in $DATA
do
    BASE=$(basename $f .seq)
    MOST=$(cut -b 2-8 $f | sort | uniq -c | sed 's/^ *//' | sed 's/ /\t/' | sort -n -r | head -n 1 | awk '{print $2}')
    echo "${MOST}"
    grep "${MOST}" $f > ${OUTPUT%%/}/"${BASE}_topseed.txt"
done
