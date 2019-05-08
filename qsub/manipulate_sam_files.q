#!/bin/bash

#PBS -l nodes=1:ppn=4
#PBS -l walltime=05:00:00
#PBS -M earmingol@eng.ucsd.edu
#PBS -m aeb
#PBS -q hotel

OUTPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/

/home/ucsd-train70/Erick/siob242c_work/mrnaseq/bin/sam_stats.sh > $OUTPUT$"/sam_stats.txt"
/home/ucsd-train70/Erick/siob242c_work/mrnaseq/bin/extract_aligned_reads.sh