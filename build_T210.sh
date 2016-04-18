#! /bin/bash

rm ~/time_previous.txt
mv ~/time.txt  ~/time_previous.txt



echo -e "\E[1;36mMoving to source directory..."; tput sgr0
echo " "
cd ~/cm13_T210

date  >> ~/time.txt
echo " " >> ~/time.txt
echo " "
echo -e "\E[1;36mEnsuring ccache is used..."; tput sgr0
echo " "
export USE_CCACHE=1
echo -e "\E[1;36mSetting up source environment..."; tput sgr0
echo " "
source build/envsetup.sh
echo " "
#echo -e "\E[1;36mMaking breakfast before clobber..."; tput sgr0
#echo " "
#breakfast lt02wifi
#echo " "
#echo -e "\E[1;36mDeleting output folder..."; tput sgr0
#echo " "
#make clobber
#echo " "
echo -e "\E[1;36mBuilding T210..."; tput sgr0
echo " "
echo " " >> ~/time.txt
echo " " >> ~/time.txt
echo "T210 build START time..." $(date +"%T") >> ~/time.txt
brunch lt02wifi

echo "T210 build STOP time...." $(date +"%T") >> ~/time.txt
echo " "

if [ ! -d ~/Builds ]; then
    mkdir ~/Builds
fi

if [ ! -d ~/Builds/$(date +"%m-%d-%Y") ]; then
    mkdir ~/Builds/$(date +"%m-%d-%Y")
fi

cp ~/cm13_T210/out/target/product/lt02wifi/cm-13*.zip  ~/Builds/$(date +"%m-%d-%Y")/

done
