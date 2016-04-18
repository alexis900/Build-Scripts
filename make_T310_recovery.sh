#! /bin/bash

echo -e "\E[1;36mMoving to source directory..."; tput sgr0
echo " "
cd ~/cm13
echo " "
echo -e "\E[1;36mEnsuring ccache is used..."; tput sgr0
echo " "
export USE_CCACHE=1
echo -e "\E[1;36mSetting up source environment..."; tput sgr0
echo " "
source build/envsetup.sh
echo " "
echo -e "\E[1;36mMaking breakfast..."; tput sgr0
echo " "
breakfast lt01wifi
echo " "
#echo -e "\E[1;36mDeleting output folder..."; tput sgr0
#echo " "
#make clobber
#echo " "
echo -e "\E[1;36mBuilding T310 recovery..."; tput sgr0
echo " "
make -j4 recoveryimage

if [ ! -d ~/Builds ]; then
    mkdir ~/Builds
fi

if [ ! -d ~/Builds/$(date +"%m-%d-%Y") ]; then
    mkdir ~/Builds/$(date +"%m-%d-%Y")
fi

if [ ! -d ~/Builds/$(date +"%m-%d-%Y")/T310 ]; then
    mkdir ~/Builds/$(date +"%m-%d-%Y")/T310
fi

cp ~/cm13/out/target/product/lt01wifi/recovery.img  ~/Builds/$(date +"%m-%d-%Y")/T310/


done
