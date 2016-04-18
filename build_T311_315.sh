#! /bin/bash

rm ~/time_previous.txt
mv ~/time.txt  ~/time_previous.txt



echo -e "\E[1;36mMoving to source directory..."; tput sgr0
echo " "
cd ~/cm13

echo -e "\E[1;36mEnsuring ccache is used..."; tput sgr0
echo " "
export USE_CCACHE=1
echo -e "\E[1;36mSetting up source environment..."; tput sgr0
echo " "
source build/envsetup.sh
echo " "

echo -e "\E[1;36mBuilding T311..."; tput sgr0
echo " "
echo " " >> ~/time.txt
echo " " >> ~/time.txt
echo "T311 build START time..." $(date +"%T") >> ~/time.txt
brunch lt013g | tee >(tail -3 > output.txt)
mail -s "T311 build status" "gr8nole@gmail.com" < output.txt

echo "T311 build STOP time...." $(date +"%T") >> ~/time.txt
echo " "


if [ ! -d ~/Builds ]; then
    mkdir ~/Builds
fi

if [ ! -d ~/Builds/$(date +"%m-%d-%Y") ]; then
    mkdir ~/Builds/$(date +"%m-%d-%Y")
fi

cp ~/cm13/out/target/product/lt013g/cm-13*.zip  ~/Builds/$(date +"%m-%d-%Y")/

echo -e "\E[1;36mBuilding T315..."; tput sgr0
echo " "
echo " " >> ~/time.txt
echo " " >> ~/time.txt
echo "T315 build START time..." $(date +"%T") >> ~/time.txt
brunch lt01lte | tee >(tail -3 > output.txt)
mail -s "T315 build status" "gr8nole@gmail.com" < output.txt

echo "T315 build STOP time...." $(date +"%T") >> ~/time.txt

cp ~/cm13/out/target/product/lt01lte/cm-13*.zip  ~/Builds/$(date +"%m-%d-%Y")/

done
