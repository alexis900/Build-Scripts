#! /bin/bash

tput setf 6; echo "Moving to source directory..."; tput setf 7
echo " "
cd ~/cm11
echo " "
tput setf 6; echo "Ensuring ccache is used..."; tput setf 7
echo " "
export USE_CCACHE=1
tput setf 6; echo "Setting up source environment..."; tput setf 7
echo " "
source build/envsetup.sh
echo " "
tput setf 6; echo "Making breakfast..."; tput setf 7
echo " "
breakfast goyawifi
echo " "
#tput setf 6; echo "Deleting output folder..."; tput setf 7
#echo " "
#make clobber
#echo " "
tput setf 6; echo "Building T110 recovery..."; tput setf 7
echo " "
make -j4 recoveryimage

mkdir ~/Builds

mkdir ~/Builds/$(date +"%m-%d-%Y")

mkdir ~/Builds/$(date +"%m-%d-%Y")/T110

cp ~/cm11/out/target/product/goyawifi/recovery.img  ~/Builds/$(date +"%m-%d-%Y")/T110/


done
