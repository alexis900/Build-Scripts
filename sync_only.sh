#! /bin/bash


tput setf 6; echo  "Moving to source directory..."; tput setf 7
echo " "
cd ~/cm11

tput setf 6; echo "Syncing repo..."; tput setf 7
echo " "
repo sync -c

#repo sync -c
echo " "
tput setf 6; echo "Moving to vendor/cm..."; tput setf 7
echo " "

cd ~/cm11/vendor/cm

tput setf 6; echo "Getting pre-builts..."; tput setf 7
echo " "

 ./get-prebuilts
echo " "


done
