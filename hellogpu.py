import os
import time
import sys
from subprocess import check_output

def run(cmd):
  output = check_output(cmd, shell=True)
  print(str(output, 'utf-8'))

print("GPUs connected:")
run('nvidia-smi')

print("What version of python are we using?")
print(sys.version)

print("Trying to output some error message to stderr")
sys.stderr.write("Hello hello this is stderr\n\n")


print("Attempting to import torch and do something that requires the GPU")
import torch
print("Congratulations! torch version is {}".format(torch.__version__))

# TODO: Use 8 GPUs!

foo = torch.FloatTensor((100, 1000, 1000))
foo.cuda()
print("Here is a CUDA tensor:")
print(foo)
print(foo.shape)
print("Here is a sum:")
print(foo.sum())

print("GPU memory use:")
run('nvidia-smi')
time.sleep(10)
