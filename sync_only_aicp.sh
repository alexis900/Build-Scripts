#! /bin/bash

echo -e "\E[1;36mMoving to AICP source directory..."; tput sgr0
echo " "
cd ~/aicp

echo -e "\E[1;36mSyncing AICP repo..."; tput sgr0
echo " "
repo sync 
