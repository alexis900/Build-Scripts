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

newtarget=$(find ~/$SOURCE/out/target/product/$DEVICE/obj/PACKAGING/target_files_intermediates/*.zip -maxdepth 1 -mtime -1)
./build/tools/releasetools/ota_from_target_files -i /home/dave/Builds/ota_base/${SOURCE:n:2}*_$DEVICE-target_files-*.zip $newtarget ~/Builds/$(date +"%m-%d-%Y")/$SOURCE-$DEVICE-inc_update_$(date +"%Y%m%d").zip

