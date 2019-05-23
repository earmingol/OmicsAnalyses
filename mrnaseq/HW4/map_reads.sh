#!/usr/bin/env bash
module load bowtie

FASTQ=$1
BOWTIE_INDEXES=$2
OUTPUT=$3

export $BOWTIE_INDEXES

for f in `echo ${FASTQ}"/*.fastq"`
do
    BASE=$(basename -- $f)
    bowtie -v 3 -S -q hg19 $FASTQ$BASE $OUTPUT${BASE//.fastq/.sam}
done