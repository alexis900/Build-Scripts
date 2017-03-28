#! /bin/bash


export PATH=${PATH}:~/bin

 PASS=$(< ~/bin/pass)
 echo -e "\E[1;32mUploading zips..."; tput sgr0
 echo " "
 ls ~/Builds/$(date +"%m-%d-%Y" --date="-1 day")/*.zip > files.txt
 mapfile -t myArray < files.txt
 curl -T ${myArray[0]} ftp://uploads.androidfilehost.com --user gr8nole:$PASS
 curl -T ${myArray[1]} ftp://uploads.androidfilehost.com --user gr8nole:$PASS
 curl -T ${myArray[2]} ftp://uploads.androidfilehost.com --user gr8nole:$PASS
 rm files.txt


exec $SHELL
