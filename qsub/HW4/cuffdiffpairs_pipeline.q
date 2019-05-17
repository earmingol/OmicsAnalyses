#!/bin/bash

#PBS -N CuffdiffPairs
#PBS -l nodes=1:ppn=4
#PBS -l walltime=24:00:00
#PBS -M earmingol@eng.ucsd.edu
#PBS -m aeb
#PBS -q hotel

ROOT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/bin/HW4/
#OUTPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/cuffdiff_work/
#INPUT=/home/ucsd-train70/Erick/siob242c_work/mrnaseq/outputs/HW4/

# Compare pair of samples
$ROOT$"cuffdiff_compare_bypair.sh"