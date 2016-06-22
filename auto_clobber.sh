#! /bin/bash
export EXPERIMENTAL_USE_JAVA8=true
echo -e "\E[1;36mMoving to AICP source directory..."; tput sgr0
echo " "
cd ~/aicp
echo " "
echo -e "\E[1;36mSetting up source environment..."; tput sgr0
echo " "
source build/envsetup.sh
echo " "
echo -e "\E[1;36mDeleting output folder..."; tput sgr0
echo " "
make clobber

echo -e "\E[1;36mMoving to Bliss source directory..."; tput sgr0
echo " "
cd ~/bliss
echo " "
echo -e "\E[1;36mSetting up source environment..."; tput sgr0
echo " "
source build/envsetup.sh
echo " "
echo -e "\E[1;36mDeleting output folder..."; tput sgr0
echo " "
make clobber

echo -e "\E[1;36mMoving to CM13 source directory..."; tput sgr0
echo " "
cd ~/cm13
echo " "
echo -e "\E[1;36mSetting up source environment..."; tput sgr0
echo " "
source build/envsetup.sh
echo " "
echo -e "\E[1;36mDeleting output folder..."; tput sgr0
echo " "
make clobber

exec $SHELL
