export PATH=${PATH}:~/bin

export scriptsdir=scripts   # set this path to the folder where the scripts are located
while :
do

export SPACE=$(df -h /tmp | tail -1 | awk '{print $4}')

stats=$(~/lineage/prebuilts/misc/linux-x86/ccache/ccache -s)
ccachesize=$(echo "$stats" | grep -m 1 'cache size')
size=$(echo "$ccachesize" | cut -b 37-48 )


  echo 
  echo "================== gr8nole's Build Menu ===================="
  echo "  Current Project - $SOURCE	     Disk Space Avail=${SPACE}b"           
  echo "  Current Device  - $DEVICE	     \033[38;5;46mccache=$size\033[39m      "
  echo "============================================================"
  echo  "                       	        "
  echo -n "  MAIN MENU";echo "                     "
  echo
echo " c. - Select crDroid as project	1d.- Select T310 as device"
echo "  . -                     	2d.- Select T311 as device"
echo " l. - Select Lineage as project	3d.- Select T315 as device"
echo "  "
echo " 5. - Sync Project        	5b.- Sync, Build & Up Project"
echo " 6. -                     	5x.- "
echo " 7. - Build All Three & Up      5c.- "
echo " 8. - Build T310 & Up            g. - "	
echo " 9. - Build T311 & Up           cc.- Clobber"
echo " 10.- Build T315 & Up    	mb.- Make bootimage"		 
echo " 11.- Build T311 & T315 & Up	t.- Project Terminal"		
echo " 12.- Build Device - no Up"
echo " 13.-              "
echo " r.- Reset Colors		uu.- Check all ccache stats"
echo " x.- EXIT "
  echo 
  echo -n "Enter option: "
  read opt
if [ "$?" != "1" ]
  then
    case $opt in
      a) ;;
      c) export SOURCE=crdroid;tput setaf 3;tput sgr0;;
      l) export SOURCE=lineage;tput setaf 3;tput sgr0;;
      4) ;;
      5) ~/$scriptsdir/sync_only.sh;~/$scriptsdir/merge.sh;tput setaf 3;;
      6) ;;
      7) ~/$scriptsdir/clobber.sh;~/$scriptsdir/build_nosync.sh;tput setaf 3;;
      8) ~/$scriptsdir/clobber.sh;export DEVICE=lt01wifi;~/$scriptsdir/build_device.sh;tput setaf 3;;
      9) ~/$scriptsdir/clobber.sh;export DEVICE=lt013g;~/$scriptsdir/build_device.sh;tput setaf 3;;
      10) ~/$scriptsdir/clobber.sh;export DEVICE=lt01lte;~/$scriptsdir/build_device.sh;tput setaf 3;;
      11) ~/$scriptsdir/clobber.sh;~/$scriptsdir/build_T311_315.sh;tput setaf 3;;
      12) ~/$scriptsdir/clobber.sh;~/$scriptsdir/build_device_no_up.sh;tput setaf 3;;
      13) ;;
      1d) export DEVICE=lt01wifi;tput setaf 3;tput sgr0;;
      2d) export DEVICE=lt013g;tput setaf 3;tput sgr0;;
      3d) export DEVICE=lt01lte;tput setaf 3;tput sgr0;;
      4a) ;;
      5b) ~/$scriptsdir/clobber.sh;~/$scriptsdir/build.sh;tput setaf 3;;
      5x) ;;
      5c) ;;
      g)  ;;
      cc) ~/$scriptsdir/clobber.sh;tput setaf 3;;
      mb)  ~/$scriptsdir/make_bootimage.sh;tput setaf 3;;
      t) gnome-terminal  --working-directory=/home/dave/$SOURCE;tput setaf 3;;
      u) ;;
      v) ;;
      r) tput sgr0;;
      uu) ~/lineage/prebuilts/misc/linux-x86/ccache/ccache -s;tput setaf 3;;
      x) exit;;
    esac
  fi
done


