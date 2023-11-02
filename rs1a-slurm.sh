#!/bin/bash

# Submit this script with: sbatch <this-filename>

#SBATCH --time=24:00:00   # walltime
#SBATCH --ntasks=5   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH -J "rs1a"   # job name

## /SBATCH -p general # partition (queue)
#SBATCH -o rs1a-slurm.%N.%j.out # STDOUT
#SBATCH -e rs1a-slurm.%N.%j.err # STDERR

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE
python -u -c "import PyHipp as pyh; import DataProcessingTools as DPT; import time; import os; t0 = time.time(); print(time.localtime()); os.chdir('session01'); DPT.objects.processDirs(dirs=None, objtype=pyh.RPLSplit, channel=[*range(1,33)], SkipHPC=False, HPCScriptsDir = '/data/src/PyHipp/', SkipLFP=False, SkipHighPass=False, SkipSort=False); print(time.localtime()); print(time.time()-t0);"
