#! /bin/bash

tput setf 6; echo "Merging frameworks/av..."; tput setf 7
echo " "
cd ~/cm11/frameworks/av
#git remote add upstream https://github.com/kumajaya/android_frameworks_av
#git fetch upstream
#git checkout cm-11.0
#git merge -m "merge kumajaya commits" upstream/cm-11.0
git cherry-pick ee6fe4fb247b1bafb438f803ee3a99cf09af7ab1
echo "Done"
echo " "
tput setf 6; echo "Merging system/vold..."; tput setf 7
echo " "
cd ~/cm11/system/vold
#git remote add upstream https://github.com/kumajaya/android_system_vold
#git fetch upstream
#git checkout cm-11.0
#git merge -m "merge kumajaya commits" upstream/cm-11.0
git cherry-pick c5df0ace9b1d10ba6e6f1b73e838ffb7ad22ff1d
git cherry-pick b4a568a9cd6ab78035671b573ddcf3031486f80c
git cherry-pick 89cea1628ee38216042832d9ae4d0957a23d85c9
echo "Done"
echo " "
done
