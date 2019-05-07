#!/bin/env bash

ROOT=/home/ucsd-train70/Erick/
OUTPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/

FASTQ=${ROOT%%/}/siob242c_data/mrnaseq/wnt_seq/fastq_files/*.fastq

# Extract sequences from all fastq files

for f in $FASTQ
do
    BASE=$(basename -- $f)
    ${ROOT%%/}/bin/fastq2fasta < $f | ${ROOT%%/}/bin/fasta1ln > ${OUTPUT%%/}/${BASE//fastq/seq}
    VALUES=$(cat ${OUTPUT%%/}/${BASE//fastq/seq} | grep -v "\n" | wc)
    READS=$(echo $VALUES | awk '{print $1}')
    CHARS=$(echo $VALUES | awk '{print $3}')
    NTS=$(($CHARS-(2*$READS)))
    echo -e ${BASE}$"\t"$READS$"\t"$NTS
done
