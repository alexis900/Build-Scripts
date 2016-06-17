#! /bin/bash

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
export DEVICE=lt01wifi
echo -e "\E[1;32mBuilding T310..."; tput sgr0
echo " "
echo " " >> ~/time.txt
echo " " >> ~/time.txt
echo "T310 build START time..." $(date +"%T") >> ~/time.txt
brunch $DEVICE | tee >(tail -3 > output.txt)
mail -s "T310 $SOURCE build status" "gr8nole@gmail.com" < output.txt

echo "T310 build STOP time...." $(date +"%T") >> ~/time.txt
echo " "

if [ ! -d ~/Builds ]; then
    mkdir ~/Builds
fi

if [ ! -d ~/Builds/$(date +"%m-%d-%Y") ]; then
    mkdir ~/Builds/$(date +"%m-%d-%Y")
fi

shopt -s nocaseglob
if [ -f ~/$SOURCE/out/target/product/$DEVICE/${SOURCE:n:2}*UNOFFICIAL*.zip ]; then 
   cp ~/$SOURCE/out/target/product/$DEVICE/${SOURCE:n:2}*UNOFFICIAL*.zip  ~/Builds/$(date +"%m-%d-%Y")/
 else echo "not found"; exit
fi
shopt -u nocaseglob

#echo -e "\E[1;32mMaking incremental OTA update..."; tput sgr0
#echo " "
#
#newtarget=$(find ~/$SOURCE/out/target/product/$DEVICE/obj/PACKAGING/target_files_intermediates/*.zip -maxdepth 1 -mtime -1)
#./build/tools/releasetools/ota_from_target_files -i /home/dave/Builds/ota_base/${SOURCE:n:2}*_$DEVICE-target_files-*.zip $newtarget ~/Builds/$(date +"%m-%d-%Y")/$SOURCE-$DEVICE-inc_update_$(date +"%Y%m%d").zip
#
#   
#if [ -f ~/Builds/$(date +"%m-%d-%Y")/$SOURCE-$DEVICE-inc_update_$(date +"%Y%m%d").zip ]; then
#  if [ ! -d ~/Builds/ota_base/old ]; then
#      mkdir ~/Builds/ota_base/old
#  fi
# mv ~/Builds/ota_base/${SOURCE:n:2}*_$DEVICE-target_files-*.zip ~/Builds/ota_base/old/
# cp ~/$SOURCE/out/target/product/$DEVICE/obj/PACKAGING/target_files_intermediates/${SOURCE:n:2}*_$DEVICE-target_files-*.zip ~/Builds/ota_base/
 PASS=$(< ~/bin/pass)
 echo -e "\E[1;32mUploading $DEVICE $SOURCE zips..."; tput sgr0
 echo " "
 ls ~/Builds/$(date +"%m-%d-%Y")/*${SOURCE:1:1}*$DEVICE*.zip > files.txt
 mapfile -t myArray < files.txt
 curl -T ${myArray[0]} ftp://uploads.androidfilehost.com --user gr8nole:$PASS
# curl -T ${myArray[1]} ftp://uploads.androidfilehost.com --user gr8nole:$PASS
 rm files.txt
#
#fi

export DEVICE=lt013g
echo -e "\E[1;32mBuilding T311..."; tput sgr0
echo " "
echo " " >> ~/time.txt
echo " " >> ~/time.txt
echo "T311 build START time..." $(date +"%T") >> ~/time.txt
brunch $DEVICE | tee >(tail -3 > output.txt)
mail -s "T311 $SOURCE build status" "gr8nole@gmail.com" < output.txt

echo "T311 build STOP time...." $(date +"%T") >> ~/time.txt
echo " "

shopt -s nocaseglob
if [ -f ~/$SOURCE/out/target/product/$DEVICE/${SOURCE:n:2}*UNOFFICIAL*.zip ]; then 
   cp ~/$SOURCE/out/target/product/$DEVICE/${SOURCE:n:2}*UNOFFICIAL*.zip  ~/Builds/$(date +"%m-%d-%Y")/
 else echo "not found"; exit
fi
shopt -u nocaseglob

#echo -e "\E[1;32mMaking incremental OTA update..."; tput sgr0
#echo " "
#
#newtarget=$(find ~/$SOURCE/out/target/product/$DEVICE/obj/PACKAGING/target_files_intermediates/*.zip -maxdepth 1 -mtime -1)
#./build/tools/releasetools/ota_from_target_files -i /home/dave/Builds/ota_base/${SOURCE:n:2}*_$DEVICE-target_files-*.zip $newtarget ~/Builds/$(date +"%m-%d-%Y")/$SOURCE-$DEVICE-inc_update_$(date +"%Y%m%d").zip
#
#   
#if [ -f ~/Builds/$(date +"%m-%d-%Y")/$SOURCE-$DEVICE-inc_update_$(date +"%Y%m%d").zip ]; then
#  if [ ! -d ~/Builds/ota_base/old ]; then
#      mkdir ~/Builds/ota_base/old
#  fi
# mv ~/Builds/ota_base/${SOURCE:n:2}*_$DEVICE-target_files-*.zip ~/Builds/ota_base/old/
# cp ~/$SOURCE/out/target/product/$DEVICE/obj/PACKAGING/target_files_intermediates/${SOURCE:n:2}*_$DEVICE-target_files-*.zip ~/Builds/ota_base/
 PASS=$(< ~/bin/pass)
 echo -e "\E[1;32mUploading $DEVICE $SOURCE zips..."; tput sgr0
 echo " "
 ls ~/Builds/$(date +"%m-%d-%Y")/*${SOURCE:1:1}*$DEVICE*.zip > files.txt
 mapfile -t myArray < files.txt
 curl -T ${myArray[0]} ftp://uploads.androidfilehost.com --user gr8nole:$PASS
# curl -T ${myArray[1]} ftp://uploads.androidfilehost.com --user gr8nole:$PASS
 rm files.txt
#
#fi

export DEVICE=lt01lte
echo -e "\E[1;32mBuilding T315..."; tput sgr0
echo " "
echo " " >> ~/time.txt
echo " " >> ~/time.txt
echo "T315 build START time..." $(date +"%T") >> ~/time.txt
brunch $DEVICE | tee >(tail -3 > output.txt)
mail -s "T315 $SOURCE build status" "gr8nole@gmail.com" < output.txt

echo "T315 build STOP time...." $(date +"%T") >> ~/time.txt

shopt -s nocaseglob
if [ -f ~/$SOURCE/out/target/product/$DEVICE/${SOURCE:n:2}*UNOFFICIAL*.zip ]; then 
   cp ~/$SOURCE/out/target/product/$DEVICE/${SOURCE:n:2}*UNOFFICIAL*.zip  ~/Builds/$(date +"%m-%d-%Y")/
 else echo "not found"; exit
fi
shopt -u nocaseglob

#echo -e "\E[1;32mMaking incremental OTA update..."; tput sgr0
#echo " "
#
#newtarget=$(find ~/$SOURCE/out/target/product/$DEVICE/obj/PACKAGING/target_files_intermediates/*.zip -maxdepth 1 -mtime -1)
#./build/tools/releasetools/ota_from_target_files -i /home/dave/Builds/ota_base/${SOURCE:n:2}*_$DEVICE-target_files-*.zip $newtarget ~/Builds/$(date +"%m-%d-%Y")/$SOURCE-$DEVICE-inc_update_$(date +"%Y%m%d").zip
#
#   
#if [ -f ~/Builds/$(date +"%m-%d-%Y")/$SOURCE-$DEVICE-inc_update_$(date +"%Y%m%d").zip ]; then
#  if [ ! -d ~/Builds/ota_base/old ]; then
#      mkdir ~/Builds/ota_base/old
#  fi
# mv ~/Builds/ota_base/${SOURCE:n:2}*_$DEVICE-target_files-*.zip ~/Builds/ota_base/old/
# cp ~/$SOURCE/out/target/product/$DEVICE/obj/PACKAGING/target_files_intermediates/${SOURCE:n:2}*_$DEVICE-target_files-*.zip ~/Builds/ota_base/
 PASS=$(< ~/bin/pass)
 echo -e "\E[1;32mUploading $DEVICE $SOURCE zips..."; tput sgr0
 echo " "
 ls ~/Builds/$(date +"%m-%d-%Y")/*${SOURCE:1:1}*$DEVICE*.zip > files.txt
 mapfile -t myArray < files.txt
 curl -T ${myArray[0]} ftp://uploads.androidfilehost.com --user gr8nole:$PASS
# curl -T ${myArray[1]} ftp://uploads.androidfilehost.com --user gr8nole:$PASS
 rm files.txt
#
#fi
