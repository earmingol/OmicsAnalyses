#!/usr/bin/env bash

SAM=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/*.sam

echo -e 'FILE\tSIZE\tTOTAL READS\tALIGNED READS\tPERCENTAGE'
for f in $SAM
do
    FILENAME=$(basename -- $f)
    SIZE=$(ls -l --block-size=GB $f| awk '{print $5}')
    TOTAL_READS=$(grep -v '@SQ\|@PG' $f | grep -c "$")
    ALIGNED_READS=$(grep -v '@SQ\|@PG' $f | awk '{print $3}' | grep -v "*" | grep -c "$")
    PERCENTAGE=$((100*ALIGNED_READS/TOTAL_READS))
    echo -e $FILENAME$"\t"$SIZE$"\t"$TOTAL_READS$"\t"$ALIGNED_READS$"\t"$PERCENTAGE
done


