#!/bin/bash

WHOAMI=`whoami`

# use current working directory for input and output
# default is to use the users home directory
#$ -cwd

# name this job
#$ -N Pytorch-Job

# send stdout and stderror to this file
#$ -o ~/
#$ -j y

# select queue - if needed 
#$ -q gpu1,gpu2

# print date and time
echo "Starting job:"
date
hostname
uname -a

function get_gpu_or_die() {
    GPU_IDS=$(nvidia-smi pmon -c 1 -s um | grep "-") 
    if [[ $GPU_IDS ]]; then
      echo $GPU_IDS | awk '{print $1}' | sort -R | head -1
    else
      echo "Sorry, no GPU is available on machine `hostname`"
      exit 1
    fi
}

export CUDA_VISIBLE_DEVICES=$(get_gpu_or_die)
export PATH=/nfs/stak/users/$WHOAMI/miniconda3/bin/:$PATH
python hellogpu.py

echo "Finished Job:"
date
