#!/bin/bash

# use current working directory for input and output
# default is to use the users home directory
#$ -cwd

# name this job
# what on earth are these comments being parsed?
#$ -N Pytorch-Job

# send stdout and stderror to this file
#$ -o /scratch/cluster-share/nealla/
#$ -j y

# select queue - if needed 
#$ -q gpu1,gpu2

# see where the job is being run
hostname

# print date and time
echo "Starting job:"
date

function get_gpu_or_die() {
    GPU_IDS=$(nvidia-smi pmon -c 1 -s um | grep "-") 
    if [[ $GPU_IDS ]]; then
      echo $GPU_IDS | awk '{print $1}' | sort -R | head -1
    else
      echo "Sorry, no GPU is available"
      exit 1
    fi
}

export CUDA_VISIBLE_DEVICES=$(get_gpu_or_die)
export PATH=/nfs/stak/users/nealla/miniconda3/bin/:$PATH
python hellogpu.py

nvidia-smi pmon -c 1 -s um
echo "Finished Job:"
date
