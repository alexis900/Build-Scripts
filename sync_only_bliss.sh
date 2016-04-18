#! /bin/bash

echo -e "\E[1;36mMoving to Bliss source directory..."; tput sgr0
echo " "
cd ~/bliss

echo -e "\E[1;36mSyncing Bliss repo..."; tput sgr0
echo " "
repo sync 
