#! /bin/bash

rm ~/time_previous.txt
mv ~/time.txt  ~/time_previous.txt

export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

echo -e "\E[1;32mMoving to $SOURCE source directory..."; tput sgr0
echo " "
cd ~/$SOURCE

./prebuilts/sdk/tools/jack-admin kill-server

date  >> ~/time.txt
echo " " >> ~/time.txt

echo -e "\E[1;32mEnsuring ccache is used..."; tput sgr0
echo " "
export USE_CCACHE=1
echo -e "\E[1;32mSetting up source environment..."; tput sgr0
echo " "
source build/envsetup.sh
echo " "

echo -e "\E[1;32mBuilding $DEVICE..."; tput sgr0
echo " "
echo " " >> ~/time.txt
echo " " >> ~/time.txt
echo "$DEVICE build START time..." $(date +"%T") >> ~/time.txt
brunch $DEVICE | tee >(tail -3 > output.txt)
mail -s "$DEVICE $SOURCE build status" "gr8nole@gmail.com" < output.txt

echo "$DEVICE build STOP time...." $(date +"%T") >> ~/time.txt
echo " "

if [ ! -d ~/Builds ]; then
    mkdir ~/Builds
fi

if [ ! -d ~/Builds/$(date +"%m-%d-%Y") ]; then
    mkdir ~/Builds/$(date +"%m-%d-%Y")
fi

shopt -s nocaseglob
if [ -f ~/$SOURCE/out/target/product/$DEVICE/${SOURCE:n:2}*$(date +"%Y%m%d")*.zip ]; then 
   cp ~/$SOURCE/out/target/product/$DEVICE/${SOURCE:n:2}*$(date +"%Y%m%d")*.zip  ~/Builds/$(date +"%m-%d-%Y")/
 else echo "not found"; exit
fi
shopt -u nocaseglob

