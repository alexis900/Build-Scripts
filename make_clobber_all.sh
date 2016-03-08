#! /bin/bash

tput setf 6; echo "Moving to AICP source directory..."; tput setf 7
echo " "
cd ~/aicp
echo " "
tput setf 6; echo "Setting up source environment..."; tput setf 7
echo " "
source build/envsetup.sh
echo " "
tput setf 6; echo "Deleting output folder..."; tput setf 7
echo " "
make clobber

tput setf 6; echo "Moving to Bliss source directory..."; tput setf 7
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

tput setf 6; echo "Moving to CM13 source directory..."; tput setf 7
echo " "
cd ~/cm13
echo " "
tput setf 6; echo "Setting up source environment..."; tput setf 7
echo " "
source build/envsetup.sh
echo " "
tput setf 6; echo "Deleting output folder..."; tput setf 7
echo " "
make clobber

done
