#!/usr/bin/env bash

FASTQ=/home/ucsd-train70/Erick/siob242c_data/mrnaseq/wnt_seq/fastq_files/*.fastq

# How many sequences are in each fastq file under micrornaseq?
echo 'Number of sequences per fastq file'
for f in $FASTQ
    do echo $(basename -- $f) $(expr $(grep -c "$" $f) / 4)
done


# How many gigabytes
echo 'Gygabytes per fastq file'
for f in $FASTQ
    do echo $(basename -- $f) $(ls -l --block-size=GB $f| awk '{print $5}')
done
