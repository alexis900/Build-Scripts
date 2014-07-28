#! /bin/bash

tput setf 6; echo "Merging frameworks/av..."; tput setf 7
echo " "
cd ~/cm11/frameworks/av
git remote add upstream https://github.com/kumajaya/android_frameworks_av
git fetch upstream
#git checkout cm-11.0
#git merge -m "merge kumajaya commits" upstream/cm-11.0
git cherry-pick 6efb57fcdafb139559ab93b751fcd332ca296a3b
echo "Done"
echo " "
tput setf 6; echo "Merging system/vold..."; tput setf 7
echo " "
cd ~/cm11/system/vold
git remote add upstream https://github.com/kumajaya/android_system_vold
git fetch upstream
#git checkout cm-11.0
#git merge -m "merge kumajaya commits" upstream/cm-11.0
git cherry-pick ded69dfcdd3faa8ab8998610cc12c4e1d7333690
git cherry-pick e147e2ba270eff2418cedc5e3ad195b00a72b34f
git cherry-pick bd795445b6e4f0ed2aeebfa0c2ed25fe21000ae9

#temporary until merged
tput setf 6; echo "Merging frameworks/base..."; tput setf 7
echo " "
cd ~/cm11/frameworks/base
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_base refs/changes/21/68621/5 && git checkout FETCH_HEAD

echo "Done"
echo " "
done
