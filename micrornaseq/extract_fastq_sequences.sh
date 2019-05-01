#!/bin/env bash

ROOT=/home/ucsd-train70/Erick/
OUTPUT=/home/ucsd-train70/Erick/siob242c_work/micrornaseq/outputs/

FASTQ=${ROOT%%/}/siob242c_data/micrornaseq/fastq_files/*.fastq

# Extract sequences from all fastq files

for f in $FASTQ
do
    BASE=$(basename -- $f)
    ${ROOT%%/}/bin/fastq2fasta < $f | ${ROOT%%/}/bin/fasta1ln | awk '{print $1}' > ${OUTPUT%%/}/${BASE//fastq/seq} 
done
