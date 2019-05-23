#!/usr/bin/env bash

module load samtools

INPUT=$1

echo -e 'FILE\tTOTAL READS\tDUPLICATE READS\tDE-DUPLICATE READS'
for f in `echo ${INPUT}"/*.sorted.bam"`
do
    FILENAME=$(basename -- $f)
    TOTAL_READS=$(samtools view -c $f)
    DEDUP_READS=$(samtools view -c ${f//.bam/.dedup.bam})
    REMOVED_READS=$((TOTAL_READS-DEDUP_READS))
    echo -e $FILENAME$"\t"$TOTAL_READS$"\t"$REMOVED_READS$"\t"$DEDUP_READS
done

