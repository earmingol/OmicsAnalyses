#!/bin/bash

#PBS -l nodes=1:ppn=12
#PBS -l walltime=05:00:00
#PBS -M earmingol@eng.ucsd.edu
#PBS -m aeb
#PBS -q hotel

REF_GENOME="/home/ucsd-train70/Erick/siob242c_work/reference_files/"
OUTPUT="/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/HW3/"
module load bowtie

START_TIME=$(date +%s)

bowtie-build $REF_GENOME ${REF_GENOME//.fas/}

END_TIME=$(date +%s)
RUN_TIME=$(($END_TIME-$START_TIME))
echo $"RUNNING TIME OF INDEXING $(basename -- $REF_GENOME): $RUN_TIME sec" > $OUTPUT$"/bwtidx_runtime.txt"