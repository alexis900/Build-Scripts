#! /bin/bash

tput setf 6; echo "Merging frameworks/av..."; tput setf 7
echo " "
cd ~/cm11/frameworks/av
#git remote add upstream https://github.com/kumajaya/android_frameworks_av
#git fetch upstream
#git checkout cm-11.0
#git merge -m "merge kumajaya commits" upstream/cm-11.0
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_av refs/changes/24/62924/4 && git cherry-pick FETCH_HEAD
echo "Done"
echo " "
tput setf 6; echo "Merging system/vold..."; tput setf 7
echo " "
cd ~/cm11/system/vold
git remote add upstream https://github.com/kumajaya/android_system_vold
git fetch upstream
#git checkout cm-11.0
#git merge -m "merge kumajaya commits" upstream/cm-11.0
#git cherry-pick ded69dfcdd3faa8ab8998610cc12c4e1d7333690
git cherry-pick e147e2ba270eff2418cedc5e3ad195b00a72b34f
git cherry-pick bd795445b6e4f0ed2aeebfa0c2ed25fe21000ae9

#temporary until merged
tput setf 6; echo "Merging frameworks/base..."; tput setf 7
echo " "
cd ~/cm11/frameworks/base
git remote add upstream https://github.com/kumajaya/android_frameworks_base
git fetch upstream
git cherry-pick b281d14b4b064a255b307b121b5bb3b03d0bdc97
git cherry-pick aef2cc3620875efb62bfbe0345b5310d665f9fdb

tput setf 6; echo "Merging packages/apps/Settings..."; tput setf 7
echo " "
cd ~/cm11/packages/apps/Settings
git remote add upstream https://github.com/kumajaya/android_packages_apps_Settings
git fetch upstream
git cherry-pick f81880e25d7bd075c758d0eafb8ae5b80260f86f

tput setf 6; echo "Merging hardware/samsung..."; tput setf 7
echo " "
cd ~/cm11/hardware/samsung
git remote add upstream https://github.com/kumajaya/android_hardware_samsung
git fetch upstream
git cherry-pick cfda88cb17d8e5c507a83130fe378a0de3567735

echo "Done"
echo " "
done
