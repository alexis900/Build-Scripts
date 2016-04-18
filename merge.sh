#! /bin/bash

echo " "
echo -e "\E[1;36mCherry-picking $SOURCE frameworks/av..."; tput sgr0
echo " "
echo -e "\E[1;36mMoving to $SOURCE frameworks/av directory..."; tput sgr0
echo " "
cd ~/$SOURCE/frameworks/av
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_av refs/changes/30/137230/1 && git cherry-pick FETCH_HEAD




echo " "
echo -e "\E[1;36mDone"; tput sgr0
echo " "

