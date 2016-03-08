#! /bin/bash

tput setf 6; echo "Moving to source directory..."; tput setf 7
echo " "
cd ~/bliss
echo " "
tput setf 6; echo "Setting up source environment..."; tput setf 7
echo " "
source build/envsetup.sh
echo " "
tput setf 6; echo "Deleting output folder..."; tput setf 7
echo " "
make clobber

done
