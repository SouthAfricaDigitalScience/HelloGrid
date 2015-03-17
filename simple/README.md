---
Author: Tian Bezuidenhout
Institution: University of the Free State
Email: bezuidenhoutt@ufs.ac.za
---

# Simple Job Demo

This simple demo will show you how to run a `hello-world` job on the grid, using a simple shell script.

In general, to run a simple job on SAGrid you need the following:

  1. A shell script (`.sh`) in order to wrap the executable that you want to run. We provide two simple examples:
    2. `hostname.sh` - which just returns the host name of the remote job.
    3. `cpuload.sh` -  which loads the CPU with a simple arithmetic loop (ie, it counts)
  1. A [JDL](http://diracgrid.org/files/docs/UserGuide/GettingStarted/UserJobs/JDLReference/) file (`.jdl`) to run the script. The

The JDL also tells the workload management system how to deal with input and output.
