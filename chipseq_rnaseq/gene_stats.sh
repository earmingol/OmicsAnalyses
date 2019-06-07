#!/usr/bin/env bash


FILES="/home/ucsd-train70/Erick/siob242c_work/chip+mrna/data_peaks/hESC_genes_with_SP1,SP5_peaks.txt
/home/ucsd-train70/Erick/siob242c_work/chip+mrna/data_genex/hESC_timeseries_wnt3a_PCTMAX_WT+SP5mut1+SP5mut2_13Kgenes.txt"

# Get number of genes
for f in $FILES
do
    awk '{print $1}' $f | sort | uniq | wc -l
done

# Check if the files are sorted
for f in $FILES
do
    BASE=$(basename -- $f)
    echo '*** ANALYZING FILE '${BASE}' ***'
    diff <(awk '{print $1}' $f) <(awk '{print $1}' $f | sort )
done
