#!/bin/env bash

ROOT=/home/ucsd-train70/Erick/
DATA=/home/ucsd-train70/Erick/siob242c_work/micrornaseq/outputs/*.miRNA
OUTPUT=/home/ucsd-train70/Erick/siob242c_work/micrornaseq/outputs/

#Obtain highly expressed miRNAs
for f in $DATA
do
    BASE=$(basename $f .miRNA)
    awk '$1 > 100000  {print $2}' $f > ${OUTPUT%%/}/"${BASE}.highlymiRNA"
done

cat /home/ucsd-train70/Erick/siob242c_work/micrornaseq/outputs/*.highlymiRNA | sort | uniq -c | sed 's/^ *//' | sed 's/ /\t/' | sort -n -r | awk '$1 > 9  {print $2}'
