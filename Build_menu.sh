export PATH=${PATH}:~/bin
export scriptsdir=scripts   # set this path to the folder where the scripts are located
while :
do

export SPACE=$(df -h /tmp | tail -1 | awk '{print $4}')

stats=$(~/cm13/prebuilts/misc/linux-x86/ccache/ccache -s)
ccachesize=$(echo "$stats" | grep -m 1 'cache size')
size=$(echo "$ccachesize" | cut -b 37-48 )


  echo 
  echo "============================================================"
  echo "    gr8nole's Build Menu           Current Project - $SOURCE"
  echo "============================================================"
  echo  "                       	        Disk Space Avail=${SPACE}b"
  echo -n "  MAIN MENU";echo "                     \033[38;5;46mccache=$size\033[39m"
  echo
echo " a. - Select AICP as project	1b.- "
echo " b. - Select Bliss as project	2b.- "
echo " c. - Select CM13 as project	3b.- "
echo "  "
echo " 5. - Sync Project        	5b.- Sync and Build Project"
echo " 6. -                     	5x.- "
echo " 7. - Build All Three           5c.- "
echo " 8. - Build T310                g. - "	
echo " 9. - Build T311                cc.- Clobber"
echo " 10.- Build T315          	m. - "		 
echo " 11.- Build T311 & T315   	t.- Project Terminal"		
echo " 12.-             		"
echo " 13.-             		"
echo " "
echo " r.- Reset Colors		uu.- Check all ccache stats"
echo " x.- EXIT "
  echo 
  echo -n "Enter option: "
  read opt
if [ "$?" != "1" ]
  then
    case $opt in
      a) export SOURCE=aicp;tput setaf 3;tput sgr0;;
      b) export SOURCE=bliss;tput setaf 3;tput sgr0;;
      c) export SOURCE=cm13;tput setaf 3;tput sgr0;;
      4) ;;
      5) ~/$scriptsdir/sync_only.sh;~/$scriptsdir/merge.sh;tput setaf 3;;
      6) ;;
      7) ~/$scriptsdir/clobber.sh;~/$scriptsdir/build_nosync.sh;tput setaf 3;;
      8) ~/$scriptsdir/clobber.sh;~/$scriptsdir/build_T310.sh;tput setaf 3;;
      9) ~/$scriptsdir/clobber.sh;~/$scriptsdir/build_T311.sh;tput setaf 3;;
      10) ~/$scriptsdir/clobber.sh;~/$scriptsdir/build_T315.sh;tput setaf 3;;
      11) ~/$scriptsdir/clobber.sh;~/$scriptsdir/build_T311_315.sh;tput setaf 3;;
      12) ;;
      13) ;;
      1b) ;;
      2b) ;;
      3b) ;;
      4a) ;;
      5b) ~/$scriptsdir/clobber.sh;~/$scriptsdir/build.sh;tput setaf 3;;
      5x) ;;
      5c) ;;
      g)  ;;
      cc) ~/$scriptsdir/clobber.sh;tput setaf 3;;
      m)  ;;
      t) gnome-terminal  --working-directory=/home/dave/$SOURCE;tput setaf 3;;
      u) ;;
      v) ;;
      r) tput sgr0;;
      uu) ~/cm13/prebuilts/misc/linux-x86/ccache/ccache -s;tput setaf 3;;
      x) exit;;
    esac
  fi
done


