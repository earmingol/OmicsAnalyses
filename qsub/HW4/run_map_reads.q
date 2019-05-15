#!/bin/bash

#PBS -l nodes=1:ppn=4
#PBS -l walltime=05:00:00
#PBS -M earmingol@eng.ucsd.edu
#PBS -m aeb
#PBS -q hotel

ROOT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/bin/HW4/
OUTPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/HW3/

#Map reads
$ROOT$"map_reads.sh"

#Get stats
$ROOT$"sam_stats.sh" > $OUTPUT$"/sam_stats.txt"

