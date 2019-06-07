#!/usr/bin/env bash


PEAKS="/home/ucsd-train70/Erick/siob242c_work/chip+mrna/data_peaks/hESC_genes_with_SP1,SP5_peaks.txt"
EXP="/home/ucsd-train70/Erick/siob242c_work/chip+mrna/data_genex/hESC_timeseries_wnt3a_PCTMAX_WT+SP5mut1+SP5mut2_13Kgenes.txt"
HDR="/home/ucsd-train70/Erick/siob242c_work/chip+mrna/data_genex/hESC_timeseries_wnt3a_PCTMAX_WT+SP5mut1+SP5mut2_13Kgenes.hdr"


OUTPUT="/home/ucsd-train70/Erick/siob242c_work/chip+mrna/filtered_expression.txt"
OUTPUT_HDR="/home/ucsd-train70/Erick/siob242c_work/chip+mrna/filtered_expression_hdr.txt"

# Filter gene expression based on peak list
join -1 1 -2 1  <(sort $EXP) <(sort $PEAKS) | sed "s/ /\t/g"  > $OUTPUT

# Count the number of genes
wc -l $OUTPUT

# Add Headers
cat $HDR $OUTPUT > $OUTPUT_HDR
wc -l $OUTPUT_HDR