#!/usr/bin/env bash

# How many sequences are in each fastq file under micrornaseq?
echo 'Number of sequences per fastq file'
for f in /home/ucsd-train70/Erick/siob242c_data/micrornaseq/fastq_files/*.fastq
    do echo $(basename -- $f) $(expr $(grep -c "$" $f) / 4)
done

echo ''

# How many gigabytes
echo 'Gygabytes per fastq file'
for f in /home/ucsd-train70/Erick/siob242c_data/micrornaseq/fastq_files/*.fastq
    do echo $(basename -- $f) $(ls -l --block-size=GB $f| awk '{print $5}')
done
