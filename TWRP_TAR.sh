#! /bin/bash

read -p "Enter device code: "  device
read -p "Enter TWRP version: " version


tar -H ustar -c recovery.img > $device.TWRP.$version.tar
md5sum -t $device.TWRP.$version.tar >> $device.TWRP.$version.tar
mv $device.TWRP.$version.tar $device.TWRP.$version.tar.md5

