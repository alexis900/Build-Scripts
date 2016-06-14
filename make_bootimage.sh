#! /bin/bash

echo -e "\E[1;32mMoving to $SOURCE source directory..."; tput sgr0
echo " "
cd ~/$SOURCE

echo -e "\E[1;32mEnsuring ccache is used..."; tput sgr0
echo " "
export USE_CCACHE=1
echo -e "\E[1;32mSetting up source environment..."; tput sgr0
echo " "
source build/envsetup.sh
echo " "
echo -e "\E[1;32mMaking breakfast..."; tput sgr0
breakfast $DEVICE
echo " "
echo -e "\E[1;32mBuilding $DEVICE bootimage..."; tput sgr0
echo " "

make bootimage -j4

