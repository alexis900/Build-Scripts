#! /bin/bash

rm ~/time_previous.txt
mv ~/time.txt  ~/time_previous.txt



tput setf 6; echo  "Moving to source directory..."; tput setf 7
echo " "
cd ~/cm11

date  >> ~/time.txt
echo " " >> ~/time.txt
echo "Repo sync START time..." $(date +"%T") >> ~/time.txt


tput setf 6; echo "Syncing repo..."; tput setf 7
echo " "
repo sync -c

echo "Repo sync STOP time...." $(date +"%T") >> ~/time.txt
repo sync -c
echo " "
tput setf 6; echo "Moving to vendor/cm..."; tput setf 7
echo " "

cd ~/cm11/vendor/cm

tput setf 6; echo "Getting pre-builts..."; tput setf 7
echo " "

 ./get-prebuilts
echo " "
tput setf 6; echo "Merging frameworks/av directory..."; tput setf 7
echo " "
cd ~/cm11/frameworks/av
git remote add upstream https://github.com/kumajaya/android_frameworks_av
git fetch upstream
git checkout cm-11.0
git merge upstream/cm-11.0
echo "Done"
echo " "
tput setf 6; echo "Merging system/vold..."; tput setf 7
echo " "
cd ~/cm11/system/vold
git remote add upstream https://github.com/kumajaya/android_system_vold
git fetch upstream
git checkout cm-11.0
git merge upstream/cm-11.0
echo "Done"
echo " "
tput setf 6; echo "Moving to source directory..."; tput setf 7
echo " "
cd ~/cm11
echo " "
tput setf 6; echo "Ensuring ccache is used..."; tput setf 7
echo " "
export USE_CCACHE=1
tput setf 6; echo "Setting up source environment..."; tput setf 7
echo " "
source build/envsetup.sh
echo " "
#tput setf 6; echo "Making breakfast before clobber..."; tput setf 7
#echo " "
#breakfast lt01wifi
#echo " "
#tput setf 6; echo "Deleting output folder..."; tput setf 7
#echo " "
#make clobber
#echo " "
tput setf 6; echo "Building T311..."; tput setf 7
echo " "
echo " " >> ~/time.txt
echo " " >> ~/time.txt
echo "T311 build START time..." $(date +"%T") >> ~/time.txt
brunch lt013g

echo "T311 build STOP time...." $(date +"%T") >> ~/time.txt
echo " "

mkdir ~/Builds

mkdir ~/Builds/$(date +"%m-%d-%Y")

cp ~/cm11/out/target/product/lt013g/cm-11*.zip  ~/Builds/$(date +"%m-%d-%Y")/

tput setf 6; echo "Building T310..."; tput setf 7
echo " "
echo " " >> ~/time.txt
echo " " >> ~/time.txt
echo "T310 build START time..." $(date +"%T") >> ~/time.txt
brunch lt01wifi

echo "T310 build STOP time...." $(date +"%T") >> ~/time.txt
echo " "

cp ~/cm11/out/target/product/lt01wifi/cm-11*.zip  ~/Builds/$(date +"%m-%d-%Y")/

tput setf 6; echo "Building T315..."; tput setf 7
echo " "
echo " " >> ~/time.txt
echo " " >> ~/time.txt
echo "T315 build START time..." $(date +"%T") >> ~/time.txt
brunch lt01lte

echo "T315 build STOP time...." $(date +"%T") >> ~/time.txt

cp ~/cm11/out/target/product/lt01lte/cm-11*.zip  ~/Builds/$(date +"%m-%d-%Y")/

done
