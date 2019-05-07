#!/bin/env bash

SAM=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/*.sam
OUTPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/

for f in $SAM
do
    BASE=$(basename -- $f)
    OUTPUT_FILE=${OUTPUT%%/}/${BASE//.sam/.tmp.sam}
    grep -v '@SQ\|@PG' $f | awk '{print $3}' | grep -v "*" > $OUTPUT_FILE
    cat $(grep '@SQ\|@PG' $f) $OUTPUT_FILE > ${OUTPUT%%/}/${BASE//.sam/.aligned.sam}
    rm $OUTPUT_FILE
done

