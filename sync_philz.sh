#! /bin/bash

tput setf 6; echo  "Moving to bootable source directory..."; tput setf 7
echo " "
cd ~/cm11/bootable
tput setf 6; echo  "Removing current recovery directory..."; tput setf 7
echo " "
rm -rf ~/cm11/bootable/recovery


tput setf 6; echo "Syncing Philz_Touch..."; tput setf 7
echo " "
git clone https://github.com/PhilZ-cwm6/philz_touch_cwm6.git recovery

tput setf 6; echo "sync complete..."; tput setf 7


done
