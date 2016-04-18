export PATH=${PATH}:~/bin

while :
do

export SPACE=$(df -h /tmp | tail -1 | awk '{print $4}')

stats=$(~/cm13/prebuilts/misc/linux-x86/ccache/ccache -s)
ccachesize=$(echo "$stats" | grep -m 1 'cache size')
size=$(echo "$ccachesize" | cut -b 37-48 )


  echo 
  echo "============================================================"
  echo "    gr8nole's Build Menu            >>>>--------;;;----->"
  echo "============================================================"
  echo  "                                Disk Space Avail=${SPACE}b"
  echo -n "  MAIN MENU";echo "                     \033[38;5;46mccache=$size\033[39m"
  echo
echo " 1. - AICP - Build All-NoSync	1b.- Bliss - Build All-NoSync	"
echo " 2. - AICP - Build T310   	2b.- Bliss - Build T310   	"
echo " 3. - AICP - Build T311&T315	3b.- Bliss - Build T311&T315	"
echo " 4. - Compile T310 Recovery	4a.- "
echo " 5. - Compile T311 Recovery	5a.- AICP sync only"
echo " 6. - Compile T315 Recovery	5b.- Bliss sync only"
echo " 7. -         		        5c.- cm13 sync only"
echo " 8. - cm13 Build All-NoSync	g. - "	
echo " 9. - Build cm13 all T31x	cc.- Clobber"
echo " 10.- Build T310 cm13		m. - "		 
echo " 11.- Build T311 cm13		ta.- AICP terminal"		
echo " 12.- Build T315 cm13		tb.- Bliss terminal"
echo " 13.- Build T311_315 cm13	tc.- CM13 terminal"
echo " "
echo " r.- Reset Colors		uu.- Check all ccache stats"
echo " x.- EXIT "
  echo 
  echo -n "Enter option: "
  read opt
if [ "$?" != "1" ]
  then
    case $opt in
      1) ~/scripts/clobber.sh;~/scripts/build_aicp_nosync.sh;tput setaf 3;;
      2) ~/scripts/clobber.sh;~/scripts/build_aicp_T310.sh;tput setaf 3;;
      3) ~/scripts/clobber.sh;~/scripts/build_aicp_T311_315.sh;tput setaf 3;;
      4) ~/scripts/clobber.sh;~/scripts/make_T310_recovery.sh;tput setaf 3;;
      5) ~/scripts/clobber.sh;~/scripts/make_T311_recovery.sh;tput setaf 3;;
      6) ~/scripts/clobber.sh;~/scripts/make_T315_recovery.sh;tput setaf 3;;
      7) ;;
      8) ~/scripts/clobber.sh;~/scripts/build_nosync.sh;tput setaf 3;;
      9) ~/scripts/clobber.sh;~/scripts/build.sh;tput setaf 3;;
      10) ~/scripts/clobber.sh;~/scripts/build_T310.sh;tput setaf 3;;
      11) ~/scripts/clobber.sh;~/scripts/build_T311.sh;tput setaf 3;;
      12) ~/scripts/clobber.sh;~/scripts/build_T315.sh;tput setaf 3;;
      13) ~/scripts/clobber.sh;~/scripts/build_T311_315.sh;tput setaf 3;;
      1b) ~/scripts/clobber.sh;~/scripts/build_bliss_nosync.sh;tput setaf 3;;
      2b) ~/scripts/clobber.sh;~/scripts/build_bliss_T310.sh;tput setaf 3;;
      3b) ~/scripts/clobber.sh;~/scripts/build_bliss_T311_315.sh;tput setaf 3;;
      4a) ;;
      5a) export SOURCE=aicp;~/scripts/sync_only_aicp.sh;~/scripts/merge.sh;tput setaf 3;;
      5b) export SOURCE=bliss;~/scripts/sync_only_bliss.sh;~/scripts/merge.sh;tput setaf 3;;
      5c) export SOURCE=cm13;~/scripts/sync_only.sh;~/scripts/merge.sh;tput setaf 3;;
      g)  ;;
      cc) ~/scripts/clobber.sh;tput setaf 3;;
      m)  ;;
      ta) gnome-terminal  --working-directory=/home/dave/aicp;tput setaf 3;;
      tb) gnome-terminal  --working-directory=/home/dave/bliss;tput setaf 3;;
      tc) gnome-terminal  --working-directory=/home/dave/cm13;tput setaf 3;;
      r) tput sgr0;;
      uu) ~/cm13/prebuilts/misc/linux-x86/ccache/ccache -s;tput setaf 3;;
      x) exit;;
    esac
  fi
done

