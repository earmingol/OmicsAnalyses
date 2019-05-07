#!/bin/env bash

SAM=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/*.sam
OUTPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/

for f in $SAM
do
    BASE=$(basename -- $f)
    grep -v '@SQ\|@PG' $f | awk '{print $3}' | grep -v "*" > ${OUTPUT%%/}/${BASE//.sam/.aligned.sam}
    grep '@SQ\|@PG' $f > ${OUTPUT%%/}/${BASE//.sam/.headers.sam}
done

