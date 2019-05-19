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


# Lane 3
cuffdiff -o $OUTPUT$"TIMEL3/1528/" -L "Untreated00hr","Wnt3a12hr" $REF \
$INPUT$"1525_ATCACG_L003_R1_001.sorted.dedup.bam" \
$INPUT$"1528_TGACCA_L003_R1_001.sorted.dedup.bam"

cuffdiff -o $OUTPUT$"TIMEL3/1529/" -L "Untreated00hr","Wnt3a24hr" $REF \
$INPUT$"1525_ATCACG_L003_R1_001.sorted.dedup.bam" \
$INPUT$"1529_ACAGTG_L003_R1_001.sorted.dedup.bam"

cuffdiff -o $OUTPUT$"TIMEL3/1530/" -L "Untreated00hr","Wnt3a48hr" $REF \
$INPUT$"1525_ATCACG_L003_R1_001.sorted.dedup.bam" \
$INPUT$"1530_CAGATC_L003_R1_001.sorted.dedup.bam"

# Lane 8
cuffdiff -o $OUTPUT$"TIMEL8/1528/" -L "Untreated00hr","Wnt3a12hr" $REF \
$INPUT$"1525_ATCACG_L008_R1_001.sorted.dedup.bam" \
$INPUT$"1528_TGACCA_L008_R1_001.sorted.dedup.bam"

cuffdiff -o $OUTPUT$"TIMEL8/1529/" -L "Untreated00hr","Wnt3a24hr" $REF \
$INPUT$"1525_ATCACG_L008_R1_001.sorted.dedup.bam" \
$INPUT$"1529_ACAGTG_L008_R1_001.sorted.dedup.bam"

cuffdiff -o $OUTPUT$"TIMEL8/1530/" -L "Untreated00hr","Wnt3a48hr" $REF \
$INPUT$"1525_ATCACG_L008_R1_001.sorted.dedup.bam" \
$INPUT$"1530_CAGATC_L008_R1_001.sorted.dedup.bam"