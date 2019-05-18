#!/bin/bash

#PBS -N Bowtie
#PBS -l nodes=1:ppn=4
#PBS -l walltime=24:00:00
#PBS -M earmingol@eng.ucsd.edu
#PBS -m aeb
#PBS -q hotel

ROOT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/bin/HW4/
OUTPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/HW4/
INPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/HW4/

# Map reads
$ROOT$"map_reads.sh" > $OUTPUT$"/mapping_stats.txt"

# Extract unmapped reads
/home/ucsd-train70/Erick/siob242c_work/mrnaseq/bin/HW4/extract_aligned_reads.sh $OUTPUT $INPUT

# Get stats
$ROOT$"sam_stats.sh" $INPUT > $OUTPUT$"/sam_stats.txt"

# Convert sam files into bam files
$ROOT$"sam2bam.sh" $INPUT

# Sort bam files
$ROOT$"bam_sort.sh" $INPUT

# Remove duplicates in bam files and get stats
$ROOT$"bam_rmdup.sh" $INPUT

# Get dedup stats
$ROOT$"bam_dedup_stats.sh" $INPUT > $OUTPUT$"/dedup_bam_stats.txt"