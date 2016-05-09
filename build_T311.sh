#! /bin/bash

export DEVICE=lt013g

rm ~/time_previous.txt
mv ~/time.txt  ~/time_previous.txt



echo -e "\E[1;32mMoving to $SOURCE source directory..."; tput sgr0
echo " "
cd ~/$SOURCE

date  >> ~/time.txt
echo " " >> ~/time.txt

echo -e "\E[1;32mEnsuring ccache is used..."; tput sgr0
echo " "
export USE_CCACHE=1
echo -e "\E[1;32mSetting up source environment..."; tput sgr0
echo " "
source build/envsetup.sh
echo " "

echo -e "\E[1;32mBuilding T311..."; tput sgr0
echo " "
echo " " >> ~/time.txt
echo " " >> ~/time.txt
echo "T311 build START time..." $(date +"%T") >> ~/time.txt
brunch lt013g | tee >(tail -3 > output.txt)
mail -s "T311 $SOURCE build status" "gr8nole@gmail.com" < output.txt

echo "T311 build STOP time...." $(date +"%T") >> ~/time.txt
echo " "

if [ ! -d ~/Builds ]; then
    mkdir ~/Builds
fi

if [ ! -d ~/Builds/$(date +"%m-%d-%Y") ]; then
    mkdir ~/Builds/$(date +"%m-%d-%Y")
fi

if [ -f ~/$SOURCE/out/target/product/lt013g/cm-13*.zip ]; then 
   cp ~/$SOURCE/out/target/product/lt013g/cm-13*.zip  ~/Builds/$(date +"%m-%d-%Y")/
 elif [ -f ~/$SOURCE/out/target/product/lt013g/aicp*mm*.zip ]; then 
   cp ~/$SOURCE/out/target/product/lt013g/aicp*mm*.zip  ~/Builds/$(date +"%m-%d-%Y")/
 elif [ -f ~/$SOURCE/out/target/product/lt013g/Bliss*.zip ]; then 
   cp ~/$SOURCE/out/target/product/lt013g/Bliss*.zip  ~/Builds/$(date +"%m-%d-%Y")/
fi

echo -e "\E[1;32mMaking incremental OTA update..."; tput sgr0
echo " "

./build/tools/releasetools/ota_from_target_files -i /home/dave/Builds/ota_base/${SOURCE:n:2}*_$DEVICE-target_files-*.zip ~/$SOURCE/out/target/product/$DEVICE/obj/PACKAGING/target_files_intermediates/${SOURCE:n:2}*_$DEVICE-target_files-*.zip ~/Builds/$(date +"%m-%d-%Y")/$SOURCE-$DEVICE-inc_update_$(date +"%Y%m%d").zip

   
if [ -f ~/Builds/$(date +"%m-%d-%Y")/$SOURCE-$DEVICE-inc_update_$(date +"%Y%m%d").zip ]; then
  if [ ! -d ~/Builds/ota_base/old ]; then
      mkdir ~/Builds/ota_base/old
  fi
 mv ~/Builds/ota_base/${SOURCE:n:2}*_$DEVICE-target_files-*.zip ~/Builds/ota_base/old/
 cp ~/$SOURCE/out/target/product/$DEVICE/obj/PACKAGING/target_files_intermediates/${SOURCE:n:2}*_$DEVICE-target_files-*.zip ~/Builds/ota_base/

fi
