#!/bin/bash
#################################################
#      	         Clean			        #
# Deletes at start-up all unnecessary files.	#
#						#
# Input: Summary.txt, results_0_0.txt,       	#
#	 Wwarning.txt, valwar.txt for both 	#
#	 Static and Dynamic and 		#
#	 DetermDyn.txt and DetermStat.txt.	#
#						#
# Output: none.					#
#################################################

cd ../output/Dynamic

## Remove all unnecessary files
rm -f pyxis
rm REVISEDtimingrnxBinaries_0_0.bin
rm REVISEDtimingaptBinaries_0_0.bin
rm timingrnxBinaries_0_0.bin
rm timingaptBinaries_0_0.bin
rm screenout.txt
rm valwar.txt
rm Wwarning.txt
rm DetermDyn.txt
rm DetermDyn2.txt

cd Plots
rm results_0_0.txt

cd ../../Static

## Remove all unnecessary files
rm pyxis
rm REVISEDtimingrnxBinaries_0_0.bin
rm REVISEDtimingaptBinaries_0_0.bin
rm timingrnxBinaries_0_0.bin
rm timingaptBinaries_0_0.bin
rm screenout.txt
rm valwar.txt
rm Wwarning.txt
rm DetermStat.txt
rm DetermStat2.txt

cd Plots
rm results_0_0.txt

cd ../../StaticSim

## Remove all unnecessary files
rm pyxis
rm timingrnxBinaries_0_0.bin
rm timingaptBinaries_0_0.bin
rm timingrnxBinaries_1859_518400.bin
rm timingaptBinaries_1859_518400.bin
rm timingrnxBinaries_1860_0.bin
rm timingaptBinaries_1860_0.bin
rm timingrnxBinaries_1860_86400.bin
rm timingaptBinaries_1860_86400.bin
rm screenout.txt
rm valwar.txt
rm Wwarning.txt

cd Plots
rm results_0_0.txt
rm results_1859_518400.bin
rm results_1860_0.bin
rm results_1860_86400.bin

cd ../../StaticLong

## Remove all unnecessary files
rm pyxis
rm timingrnxBinaries_0_0.bin
rm timingaptBinaries_0_0.bin
rm screenout.txt
rm valwar.txt
rm Wwarning.txt


## Will need to do same for arm test


## Clean completion message printed to terminal
echo "Clean is finished"
sleep 1s