#! /bin/bash

echo -e "\E[1;36mMoving to bootable source directory..."; tput sgr0
echo " "
cd ~/cm13/bootable
echo -e "\E[1;36mRemoving current recovery directory..."; tput sgr0
echo " "
rm -rf ~/cm13/bootable/recovery


echo -e "\E[1;36mSyncing TWRP..."; tput sgr0
echo " "
git clone https://github.com/omnirom/android_bootable_recovery.git recovery

echo -e "\E[1;36mSync complete..."; tput sgr0


done
