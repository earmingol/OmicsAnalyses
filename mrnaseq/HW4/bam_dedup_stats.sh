#!/usr/bin/env bash

module load samtools

INPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/HW4/

echo -e 'FILE\tTOTAL READS\tDUPLICATE READS\tDE-DUPLICATE READS'
for f in /home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/HW4/*.sorted.bam
do
    FILENAME=$(basename -- $f)
    TOTAL_READS=$(samtools view -c $f)
    DEDUP_READS=$(samtools view -c ${f//.bam/.dedup.bam})
    REMOVED_READS=$((TOTAL_READS-DEDUP_READS))
    echo -e $FILENAME$"\t"$TOTAL_READS$"\t"$REMOVED_READS$"\t"$DEDUP_READS
done

