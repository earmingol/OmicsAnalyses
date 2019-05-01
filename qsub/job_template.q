#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l walltime=01:00:00
#PBS -M [INSERT YOUR EMAIL HERE]
#PBS -m aeb
#PBS -q hotel

### The lines above this comment set some parameters for the job script - Michelle:

## PBS -l nodes=#;ppn=# ===> denotes the amount of processing power you wish to use (# nodes and # processor per node)
## PBS -l walltime=HH:MM:SS ===> denotes the amount of walltime you wish to allocate to the job
## PBS -M x@ucsd.edu ===> if you put your email address here, you can get updates to your email
## PBS -m aeb ===> a: abort notifications, e: job ending notificattions, b: job beginning information
## PBS -q hotel ===> denotes where you'll be getting resources from (don't change this line)

### PLACE ALL COMMANDS TO RUN ON A JOB BELOW THIS LINE ###
