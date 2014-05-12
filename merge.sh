#! /bin/bash

tput setf 6; echo "Merging frameworks/av..."; tput setf 7
echo " "
cd ~/cm11/frameworks/av
git remote add upstream https://github.com/kumajaya/android_frameworks_av
git fetch upstream
git checkout cm-11.0
git merge -m "merge kumajaya commits" upstream/cm-11.0
echo "Done"
echo " "
tput setf 6; echo "Merging system/vold..."; tput setf 7
echo " "
cd ~/cm11/system/vold
git remote add upstream https://github.com/kumajaya/android_system_vold
git fetch upstream
git checkout cm-11.0
git merge -m "merge kumajaya commits" upstream/cm-11.0
echo "Done"
echo " "

done
