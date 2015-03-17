#################################################################
#!/bin/bash                                                     #
# Script Name: cpuload.sh                                       #
# Script Version:1.0                                            #
# Author: T.Bezuidenhout                                        #
# Institute: University of the Free State                       #
# Email: bezuidenhoutt@ufs.ac.za                                #
# Discription: a simple example of a script to get the cpu load.#
#################################################################

# Changelog 
# 27/06/2011 : Bruce Becker | Adding a line to try to move data from the LFC to the WN.
echo $LFC_HOST
echo $LFC_TYPE
echo $LCG_GFAL_INFOSYS

echo "setting these variables just in case"
export LFC_HOST=srvslngrd002.uct.ac.za
export LCG_GFAL_INFOSYS=srvslngrd001.uct.ac.za
export LFC_TYPE=lfc
lcg-cp -v lfn:/grid/sagrid/portal.tar.gz file:/dev/null



#Simple code to make the CPU tick over

HST=$(hostname)
WHOAMI=$(whoami)
DATE=$(date)

echo "$DATE : Testing batch host $HST..."
echo "test $2"
echo "$DATE : Io sono $WHOAMI"
echo " we will now make the cpu turn in cute little circles"
TMP=1
LOOPSIZE=$1 # should set this with an argument. In this case it takes an argument from the JDL
J=1
NMAX=3 # this is the parameter number
start=`date +%s`
echo "starting at $start"

#########################################################
#This loop goes from J which is 1 and goes to NMAX which
#is 3 then for each one
#the loop goes from 1 to the parameter set in the JDL 
#And changes the TMP variable from its current multiplied
#by the PArameter set in the JDL in this case 10000
#Then it itterates I with 1 and when its done it
#then Itterates J with 1
#########################################################

while [ $J -le $NMAX ] ;
do
        I=1
        echo "running loop $J of $NMAX"
	while [ $I -le $LOOPSIZE ] ;
        do
                TMP=$(( $TMP*$I))
                I=$(( $I + 1 ))
        done
        J=$(( $J + 1 ))
done

DATE=$(date)
end=`date +%s`
echo "ending at $end"
echo "$DATE : Batch host $HST tested !"
let duration=$end-$start
echo "The test took $duration seconds"
exit 0
# A small test of connectivity to the LFC
echo $LFC_HOST
echo $LFC_TYPE
echo $LCG_GFAL_INFOSYS
lcg-cp -v lfn:/grid/sagrid/portal.tar.gz file:/dev/null

