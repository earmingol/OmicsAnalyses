#!/bin/env bash

OUTPUT_FOLDER=$1
INPUT=$2

for f in `echo ${INPUT}"/*.sam"`
do
    BASE=$(basename -- $f)
    OUTPUT_FILE=${OUTPUT_FOLDER%%/}/${BASE//.sam/.tmp.sam}
    tail -n +87 $f | awk '$3 != "*" { print $0 }' > $OUTPUT_FILE
    OUTPUT_FINAL=${OUTPUT_FOLDER%%/}/${BASE//.sam/.aligned.sam}
    head -n 86 $f > $OUTPUT_FINAL
    cat $OUTPUT_FILE >> $OUTPUT_FINAL
    rm $OUTPUT_FILE
done

