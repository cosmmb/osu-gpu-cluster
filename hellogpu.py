import os
import sys
from subprocess import check_output

def run(cmd):
  output = check_output(cmd, shell=True)
  print(str(output, 'utf-8'))

print("GPUs connected:")
run('nvidia-smi')

print("What version of python are we using?")
print(sys.version)

import torch
print("Torch version is {}".format(torch.__version__))

# TODO: Put your torch code here

foo = torch.FloatTensor((100, 100))
foo.cuda()
print("Here is a CUDA tensor:")
print(foo)
print(foo.shape)
print("Here is a sum:")
print(foo.sum())
