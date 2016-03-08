#! /bin/bash


tput setf 6; echo  "Moving to AICP source directory..."; tput setf 7
echo " "
cd ~/aicp

tput setf 6; echo "Syncing AICP repo..."; tput setf 7
echo " "
repo sync 


