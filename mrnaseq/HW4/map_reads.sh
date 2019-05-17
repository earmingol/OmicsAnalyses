#!/usr/bin/env bash
module load bowtie

FASTQ=/home/ucsd-train70/Erick/siob242c_data/mrnaseq/wnt_seq/fastq_files/
OUTPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/HW4/

export BOWTIE_INDEXES=/home/ucsd-train70/Erick/siob242c_work/reference_files/

# SAMPLES
#1525	hESC Untreated 00hr
#1526	hESC Buffer 12hr
#1527	hESC Buffer 48hr
#1528	hESC Wnt3a 12hr
#1529	hESC Wnt3a 24hr
#1530	hESC Wnt3a 48hr

FILES="1526_CGATGT_L003_R1_001.fastq
1526_CGATGT_L008_R1_001.fastq
1528_TGACCA_L003_R1_001.fastq
1528_TGACCA_L008_R1_001.fastq"

for f in ${FASTQ}*.fastq
do
    BASE=$(basename -- $f)
    bowtie -v 3 -S -q hg19 $FASTQ$BASE $OUTPUT${BASE//.fastq/.sam}
done

# Combine lines for all samples
bowtie -v 3 -S -q hg19 $FASTQ$"1526_CGATGT_L003_R1_001.fastq",$FASTQ$"1526_CGATGT_L008_R1_001.fastq" $OUTPUT$"1526_CGATGT_L3L8_R1_001.sam"

bowtie -v 3 -S -q hg19 $FASTQ$"1528_TGACCA_L003_R1_001.fastq",$FASTQ$"1528_TGACCA_L008_R1_001.fastq" $OUTPUT$"1528_TGACCA_L3L8_R1_001.sam"