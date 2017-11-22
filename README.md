This is an example qsub job usable on submit1.hpc.engr.oregonstate.edu

This will run a job on one of the two XAI 1080Ti machines

To run it, edit `run_pytorch_job.sh` to point to your own home directory and Python installation.
In this example, I use my own miniconda installation of Python.

Then run a command like:

```
	qsub run_pytorch_job.sh
```

To submit jobs to the HPC cluster you will need to log into one of the 
cluster submit systems. These systems are:

        submit1.hpc.engr.oregonstate.edu
        submit2.hpc.engr.oregonstate.edu
        submit3.hpc.engr.oregonstate.edu

The commands you will need to master first are:

        qstat   used to check the status of a job,
                a queue, or all queues

        qsub    used to submit jobs to the cluster

        qdel    used to kill a running job

You can check syntax requirements for these and other commands by using
the 'man' command. ie man qstat or man qsub

There is also a web page for the cluster at:

        http://engr.oregonstate.edu/computing/cluster

The Users-Guide.pdf in this directory provides a great deal more information.

If you have questions direct them to support@engr.oregonstate.edu

