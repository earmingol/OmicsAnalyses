#!/bin/env bash

ROOT=/home/ucsd-train70/Erick/
DATA=/home/ucsd-train70/Erick/siob242c_work/micrornaseq/outputs/*.seq

CHAR=${1?Error: Specify nucleotide position to count}

#Count bases in $CHAR base of each sequence dataset
echo -e "Dataset\tA\tC\tG\tN\tT"
for f in $DATA
do
    BASE=$(basename $f .seq)
    echo -e $BASE$"\t"$(cut -b $CHAR $f | sort | uniq -c | awk '{print $1}' | sed 's/\n/\t/' )
done
