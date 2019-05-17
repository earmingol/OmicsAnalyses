#!/usr/bin/env bash

module load cufflinks

INPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/HW4/
OUTPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/cuffdiff_work/
REF=/home/ucsd-train70/Erick/siob242c_data/reference_files/cuffdiff/genes.gtf


# SAMPLES
#1525	hESC Untreated 00hr
#1526	hESC Buffer 12hr
#1527	hESC Buffer 48hr
#1528	hESC Wnt3a 12hr
#1529	hESC Wnt3a 24hr
#1530	hESC Wnt3a 48hr

FILES="1526_CGATGT_L003_R1_001.sorted.dedup.bam
1526_CGATGT_L008_R1_001.sorted.dedup.bam
1528_TGACCA_L003_R1_001.sorted.dedup.bam
1528_TGACCA_L008_R1_001.sorted.dedup.bam
1526_CGATGT_L3L8_R1_001.sorted.dedup.bam
1528_TGACCA_L3L8_R1_001.sorted.dedup.bam"

# Lane 3
cuffdiff -o $OUTPUT$"L3/" -L "1526_L3","1528_L3" $REF \
$INPUT$"1526_CGATGT_L003_R1_001.sorted.dedup.bam" \
$INPUT$"1528_TGACCA_L003_R1_001.sorted.dedup.bam"

# Lane 8
cuffdiff -o $OUTPUT$"L8/" -L "1526_L8","1528_L8" $REF \
$INPUT$"1526_CGATGT_L008_R1_001.sorted.dedup.bam" \
$INPUT$"1528_TGACCA_L008_R1_001.sorted.dedup.bam"

# Both Lanes
cuffdiff -o $OUTPUT$"L3L8/" -L "1526_BOTH","1528_BOTH" $REF \
$INPUT$"1526_CGATGT_L3L8_R1_001.sorted.dedup.bam" \
$INPUT$"1528_TGACCA_L3L8_R1_001.sorted.dedup.bam"
