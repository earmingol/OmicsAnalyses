#!/bin/env bash

ROOT=/home/ucsd-train70/Erick/
DATA=/home/ucsd-train70/Erick/siob242c_work/micrornaseq/outputs/*.seq
OUTPUT=/home/ucsd-train70/Erick/siob242c_work/micrornaseq/outputs/

#Get total number of unique seed, and number of each unique seed.
for f in $DATA
do
    BASE=$(basename $f .seq)
    cut -b 2-8 $f | sort | uniq -c | sed 's/^ *//' | sed 's/ /	/' | sort -n -r > ${OUTPUT%%/}/"${BASE}.seeds"
    MOST=$(cut -b 2-8 $f | sort | uniq -c | sed 's/^ *//' | sed 's/ /\t/' | sort -n -r | head -n 1)
    echo -e $BASE$"\t#UNIQUE SEEDS:\t"$(cut -b 2-8 $f | sort | uniq | grep -c "$")$"\tMOST FREQUENT:\t"$MOST
done
