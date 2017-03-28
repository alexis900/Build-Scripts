#! /bin/bash

echo "$(cat ~/bin/pass2)" | sudo -S grub-reboot 2;  sudo reboot
