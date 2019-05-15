#!/bin/bash

#PBS -l nodes=1:ppn=4
#PBS -l walltime=05:00:00
#PBS -M earmingol@eng.ucsd.edu
#PBS -m aeb
#PBS -q hotel

ROOT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/bin/HW4/
OUTPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/HW4/
SAM=$OUTPUT$"*.sam"

# Map reads
$ROOT$"map_reads.sh"

# Extract unmapped reads
/home/ucsd-train70/Erick/siob242c_work/mrnaseq/bin/HW4/extract_aligned_reads.sh $OUTPUT $SAM

# Get stats
$ROOT$"sam_stats.sh" ${SAM//.sam/.aligned.sam} > $OUTPUT$"/sam_stats.txt"

# Convert sam files into bam files
$ROOT$"sam2bam.sh" ${SAM//.sam/.aligned.sam}

# Sort bam files
BAM=$OUTPUT$"*.bam"
$ROOT$"sort_bam.sh" $BAM

# Remove duplicates in bam files
$ROOT$"rmdup_bam.sh" ${BAM//.bam/.sorted.bam}