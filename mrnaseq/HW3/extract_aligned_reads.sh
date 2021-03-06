#!/bin/env bash

SAM=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/*.sam
OUTPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/

for f in $SAM
do
    BASE=$(basename -- $f)
    OUTPUT_FILE=${OUTPUT%%/}/${BASE//.sam/.tmp.sam}
    tail -n +87 $f | awk '$3 != "*" { print $0 }' > $OUTPUT_FILE
    OUTPUT_FINAL=${OUTPUT%%/}/${BASE//.sam/.aligned.sam}
    head -n 86 $f > $OUTPUT_FINAL
    cat $OUTPUT_FILE >> $OUTPUT_FINAL
    rm $OUTPUT_FILE
done

