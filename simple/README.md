---
Authors:
  - {name: Tian Bezuidenhout, institute: University of the Free State, email: bezuidenhoutt@ufs.ac.za, github: }
  - {name: Bruce Becker, Institute: CSIR Meraka Institute, email: bbecker@csir.co.za, gitthub: brucellino}
---

# Simple Job Demo

This simple demo will show you how to run a `hello-world` job on the grid, using a simple shell script.

In general, to run a simple job on SAGrid you need the following:

  1. A shell script (`.sh`) in order to wrap the executable that you want to run. We provide two simple examples:
    2. `hostname.sh` - which just returns the host name of the remote job.
    3. `cpuload.sh` -  which loads the CPU with a simple arithmetic loop (ie, it counts)
  1. A [JDL](http://diracgrid.org/files/docs/UserGuide/GettingStarted/UserJobs/JDLReference/) file (`.jdl`) to run the script. The JDL is slightly different depending on whether you're submitting to a **[Workload Management System](ttps://wiki.italiangrid.it/twiki/bin/view/WMS)** or using Direct Submission to a [CREAM CE](https://wiki.italiangrid.it/twiki/bin/view/CREAM/JdlGuide)

The JDL also tells the grid how to deal with input and output, so that you can transfer configuration files and data in, and get the output that you're interested in back from the compute element (cluster)

# Direct submission with CREAM

***Note : We are using the dteam and sagrid.ac.za VOs here - be sure to check that you are using a VO to which you actually belong***

  1. Get a proxy: `voms-proxy-init --voms sagrid.ac.za`.
    * Example Output :
```bash
voms-proxy-init --voms sagrid.ac.za
Enter GRID pass phrase:
Your identity: /C=IT/O=INFN/OU=Personal Certificate/L=ZA-MERAKA/CN=Bruce Becker
Creating temporary proxy ............................. Done
Contacting  voms.sagrid.ac.za:15003 [/C=IT/O=INFN/OU=Host/L=ZA-UFS/CN=voms.sagrid.ac.za] "sagrid.ac.za" Done
Creating proxy .............................................................................................. Done
Your proxy is valid until Wed Mar 18 01:02:55 2015
```
  2. Find an available site: `lcg-infosites --vo dteam`
    * Example Output:
```bash
lcg-infosites --vo dteam
#   CPU	   Free	Total Jobs	Running	Waiting	ComputingElement
----------------------------------------------------------------
     24	     21	         0	      0	      0	srvslngrd007.uct.ac.za:8443/cream-pbs-sagrid
```
  2. Submit the job : `glite-ce-job-submit `
    * Example Output:
```
glite-ce-job-status https://glite-ce.grid.uj.ac.za:8443/CREAM028493431

******  JobID=[https://glite-ce.grid.uj.ac.za:8443/CREAM028493431]
	Status        = [DONE-OK]
	ExitCode      = [0]
```
