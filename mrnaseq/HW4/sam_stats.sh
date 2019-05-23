#!/usr/bin/env bash

INPUT=$1

echo -e 'FILE\tSIZE\tTOTAL READS\tALIGNED READS\tPERCENTAGE'
for f in `echo ${INPUT}"/*.aligned.sam"`
do
    FILENAME=$(basename -- $f)
    SIZE=$(ls -l --block-size=GB $f| awk '{print $5}')
    TOTAL_READS=$(tail -n +87 $f | grep -c "$")
    ALIGNED_READS=$(tail -n +87 $f | awk '{print $3}' | grep -v "*" | grep -c "$")
    if [ $TOTAL_READS -eq 0 ]
    then
        PERCENTAGE=$"0%"
    else
        PERCENTAGE=$((100*ALIGNED_READS/TOTAL_READS))$"%"
    fi
    echo -e $FILENAME$"\t"$SIZE$"\t"$TOTAL_READS$"\t"$ALIGNED_READS$"\t"$PERCENTAGE
done


