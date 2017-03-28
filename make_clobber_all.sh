#! /bin/bash

echo -e "\E[1;36mMoving to crDroid source directory..."; tput sgr0
echo " "
cd ~/crdroid
echo " "
echo -e "\E[1;36mSetting up source environment..."; tput sgr0
echo " "
source build/envsetup.sh
echo " "
echo -e "\E[1;36mDeleting output folder..."; tput sgr0
echo " "
make clobber

echo -e "\E[1;36mMoving to Lineage source directory..."; tput sgr0
echo " "
cd ~/lineage
echo " "
echo -e "\E[1;36mSetting up source environment..."; tput sgr0
echo " "
source build/envsetup.sh
echo " "
echo -e "\E[1;36mDeleting output folder..."; tput sgr0
echo " "
make clobber
