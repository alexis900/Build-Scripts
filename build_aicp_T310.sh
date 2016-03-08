#! /bin/bash

rm ~/time_previous.txt
mv ~/time.txt  ~/time_previous.txt



tput setf 6; echo  "Moving to source directory..."; tput setf 7
echo " "
cd ~/aicp

date  >> ~/time.txt
echo " " >> ~/time.txt
echo " "
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
brunch lt01wifi  | tee >(tail -50 > output.txt)

echo "T310 build STOP time...." $(date +"%T") >> ~/time.txt
echo " "

if [ ! -d ~/Builds ]; then
    mkdir ~/Builds
fi

if [ ! -d ~/Builds/$(date +"%m-%d-%Y") ]; then
    mkdir ~/Builds/$(date +"%m-%d-%Y")
fi

cp ~/aicp/out/target/product/lt01wifi/aicp*.zip  ~/Builds/$(date +"%m-%d-%Y")/ 
mail -s "build status" "gr8nole@gmail.com" < output.txt


done
