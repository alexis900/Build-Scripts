#! /bin/bash

rm ~/time_previous.txt
mv ~/time.txt  ~/time_previous.txt



tput setf 6; echo  "Moving to source directory..."; tput setf 7
echo " "
cd ~/aicp

date  >> ~/time.txt
echo " " >> ~/time.txt

tput setf 6; echo "Ensuring ccache is used..."; tput setf 7
echo " "
export USE_CCACHE=1
tput setf 6; echo "Setting up source environment..."; tput setf 7
echo " "
source build/envsetup.sh
echo " "

tput setf 6; echo "Building T310..."; tput setf 7
echo " "
echo " " >> ~/time.txt
echo " " >> ~/time.txt
echo "T310 build START time..." $(date +"%T") >> ~/time.txt
brunch lt01wifi

echo "T310 build STOP time...." $(date +"%T") >> ~/time.txt
echo " "

if [ ! -d ~/Builds ]; then
    mkdir ~/Builds
fi

if [ ! -d ~/Builds/$(date +"%m-%d-%Y") ]; then
    mkdir ~/Builds/$(date +"%m-%d-%Y")
fi

cp ~/aicp/out/target/product/lt01wifi/aicp*.zip  ~/Builds/$(date +"%m-%d-%Y")/

#rm -r ~/aicp/out/target/product/lt01wifi

tput setf 6; echo "Building T311..."; tput setf 7
echo " "
echo " " >> ~/time.txt
echo " " >> ~/time.txt
echo "T311 build START time..." $(date +"%T") >> ~/time.txt
brunch lt013g

echo "T311 build STOP time...." $(date +"%T") >> ~/time.txt
echo " "

cp ~/aicp/out/target/product/lt013g/aicp*.zip  ~/Builds/$(date +"%m-%d-%Y")/

#rm -r ~/aicp/out/target/product/lt013g

tput setf 6; echo "Building T315..."; tput setf 7
echo " "
echo " " >> ~/time.txt
echo " " >> ~/time.txt
echo "T315 build START time..." $(date +"%T") >> ~/time.txt
brunch lt01lte

echo "T315 build STOP time...." $(date +"%T") >> ~/time.txt

cp ~/aicp/out/target/product/lt01lte/aicp*.zip  ~/Builds/$(date +"%m-%d-%Y")/


done
