#!/bin/bash

#PBS -l nodes=1:ppn=4
#PBS -l walltime=05:00:00
#PBS -M earmingol@eng.ucsd.edu
#PBS -m aeb
#PBS -q hotel

OUTPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/HW3/

/home/ucsd-train70/Erick/siob242c_work/mrnaseq/bin/HW3/sam_stats.sh > $OUTPUT$"/sam_stats.txt"
/home/ucsd-train70/Erick/siob242c_work/mrnaseq/bin/HW3/extract_aligned_reads.sh