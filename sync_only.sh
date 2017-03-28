#! /bin/bash

echo -e "\E[1;36mMoving to $SOURCE source directory..."; tput sgr0
echo " "
cd ~/$SOURCE

echo -e "\E[1;36mSyncing $SOURCE repo..."; tput sgr0
echo " "
repo sync --force-sync
