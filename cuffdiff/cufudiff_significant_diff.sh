#!/usr/bin/env bash

INPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/genex/

for f in `echo ${INPUT}"/*.tsv"`
do
    SIGNIFICANT=$(cat $f | awk '$14 == "yes" { print $14 }' | grep -c $)
    echo -e $(basename -- $f)"\t"$SIGNIFICANT
done


for f in `echo ${INPUT}"/*.tsv"`
do
    echo -e $(basename -- $f)
    HEADER=$(head -n 1 $f | awk '{ print $3,$5,$6,$8,$9,$10,$14}')
    INFO=$(awk '$14 == "yes" { print $3,$5,$6,$8,$9,$10,$14}' $f)
    echo -e "$HEADER""\n""$INFO" | column -t
    echo -e "\n"
done