#!/usr/bin/env bash
module load bowtie

FASTQ=/home/ucsd-train70/Erick/siob242c_data/mrnaseq/wnt_seq/fastq_files/
OUTPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/

export BOWTIE_INDEXES=/home/ucsd-train70/Erick/siob242c_work/reference_files/

FILES="1526_CGATGT_L003_R1_001.fastq
1526_CGATGT_L008_R1_001.fastq
1528_TGACCA_L003_R1_001.fastq
1528_TGACCA_L008_R1_001.fastq"


for f in $FILES
do
    BASE=$(basename -- $f)
    bowtie -v 0 -S -q hg19 $FASTQ$f $OUTPUT${BASE//.fastq/_v0.sam}
    bowtie -v 3 -S -q hg19 $FASTQ$f $OUTPUT${BASE//.fastq/_v3.sam}
done