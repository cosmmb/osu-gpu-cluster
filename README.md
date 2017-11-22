This is an example qsub job usable on submit1.hpc.engr.oregonstate.edu
It will run `hellogpu.py` with 1 GPU on one of the XAI 1080Ti machines.

Output stderr and stdout will be written to some files in your home directory that look like `Pytorch-Job.o897123`

To run the job, edit `run_pytorch_job.sh` to point to your own home directory and Python installation.
(eg. in this example, I use miniconda installed to the default location)

Then run:

```
	qsub run_pytorch_job.sh
```
