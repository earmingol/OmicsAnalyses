#!/bin/bash

#PBS -l nodes=1:ppn=4
#PBS -l walltime=05:00:00
#PBS -M earmingol@eng.ucsd.edu
#PBS -m aeb
#PBS -q hotel

SAM_FOLDER=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/HW4/
OUTPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/HW4/

/home/ucsd-train70/Erick/siob242c_work/mrnaseq/bin/HW4/sam_stats.sh $SAM_FOLDER > $OUTPUT$"/sam_stats.txt"
/home/ucsd-train70/Erick/siob242c_work/mrnaseq/bin/HW4/extract_aligned_reads.sh $OUTPUT $SAM_FOLDER