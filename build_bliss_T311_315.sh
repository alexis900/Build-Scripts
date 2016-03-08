#! /bin/bash

rm ~/time_previous.txt
mv ~/time.txt  ~/time_previous.txt



tput setf 6; echo  "Moving to source directory..."; tput setf 7
echo " "
cd ~/bliss

tput setf 6; echo "Ensuring ccache is used..."; tput setf 7
echo " "
export USE_CCACHE=1
tput setf 6; echo "Setting up source environment..."; tput setf 7
echo " "
source build/envsetup.sh
echo " "

tput setf 6; echo "Building T311..."; tput setf 7
echo " "
echo " " >> ~/time.txt
echo " " >> ~/time.txt
echo "T311 build START time..." $(date +"%T") >> ~/time.txt
brunch lt013g | tee >(tail -50 > output.txt)
mail -s "build status" "gr8nole@gmail.com" < output.txt

echo "T311 build STOP time...." $(date +"%T") >> ~/time.txt
echo " "


if [ ! -d ~/Builds ]; then
    mkdir ~/Builds
fi

if [ ! -d ~/Builds/$(date +"%m-%d-%Y") ]; then
    mkdir ~/Builds/$(date +"%m-%d-%Y")
fi

cp ~/bliss/out/target/product/lt013g/bliss*.zip  ~/Builds/$(date +"%m-%d-%Y")/

tput setf 6; echo "Building T315..."; tput setf 7
echo " "
echo " " >> ~/time.txt
echo " " >> ~/time.txt
echo "T315 build START time..." $(date +"%T") >> ~/time.txt
brunch lt01lte | tee >(tail -50 > output.txt)
mail -s "build status" "gr8nole@gmail.com" < output.txt

echo "T315 build STOP time...." $(date +"%T") >> ~/time.txt

cp ~/bliss/out/target/product/lt01lte/bliss*.zip  ~/Builds/$(date +"%m-%d-%Y")/

done
