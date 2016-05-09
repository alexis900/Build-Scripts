#! /bin/bash


echo -e "\E[1;32mMoving to $SOURCE source directory..."; tput sgr0
echo " "
cd ~/$SOURCE

echo -e "\E[1;32mMaking incremental OTA update..."; tput sgr0
echo " "

if [ ! -d ~/Builds ]; then
    mkdir ~/Builds
fi

if [ ! -d ~/Builds/$(date +"%m-%d-%Y") ]; then
    mkdir ~/Builds/$(date +"%m-%d-%Y")
fi

./build/tools/releasetools/ota_from_target_files -i /home/dave/Builds/ota_base/${SOURCE:n:2}*_$DEVICE-target_files-*.zip ~/$SOURCE/out/target/product/$DEVICE/obj/PACKAGING/target_files_intermediates/${SOURCE:n:2}*_$DEVICE-target_files-*.zip ~/Builds/$(date +"%m-%d-%Y")/$SOURCE-$DEVICE-inc_update_$(date +"%Y%m%d").zip

   
if [ -f ~/Builds/$(date +"%m-%d-%Y")/$SOURCE-$DEVICE-inc_update_$(date +"%Y%m%d").zip ]; then
  if [ ! -d ~/Builds/ota_base/old ]; then
      mkdir ~/Builds/ota_base/old
  fi
 mv ~/Builds/ota_base/${SOURCE:n:2}*_$DEVICE-target_files-*.zip ~/Builds/ota_base/old/
 cp ~/$SOURCE/out/target/product/$DEVICE/obj/PACKAGING/target_files_intermediates/${SOURCE:n:2}*_$DEVICE-target_files-*.zip ~/Builds/ota_base/

fi
