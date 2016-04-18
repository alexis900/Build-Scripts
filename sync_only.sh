#! /bin/bash

echo -e "\E[1;36mMoving to CM13 source directory..."; tput sgr0
echo " "
cd ~/cm13

echo -e "\E[1;36mSyncing CM13 repo..."; tput sgr0
echo " "
repo sync 
