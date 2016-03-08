export PATH=${PATH}:~/bin
while :
do
  clear

  echo 
  echo "============================================================"
  echo "    gr8nole's Build Menu            >>>>--------;;;----->"
  echo "============================================================"
  echo 
  echo "> MAIN MENU"
  echo
echo " 1. - AICP - Build All-NoSync	1a.- Bliss - Build All-NoSync	"
echo " 2. - AICP - Build T310   	2a.- Bliss - Build T310   	"
echo " 3. - AICP - Build T311&T315	3a.- Bliss - Build T311&T315	"
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
echo " r.- Reset Colors		uu.- "
echo " x.- EXIT "
  echo 
  echo -n "Enter option: "
  read opt
if [ "$?" != "1" ]
  then
    case $opt in
      1) tput sgr0;~/scripts/clobber.sh;~/scripts/build_aicp_nosync.sh;tput setf 0; tput setb 7;;
      2) tput sgr0;~/scripts/clobber.sh;~/scripts/build_aicp_T310.sh;tput setf 0; tput setb 7;;
      3) tput sgr0;~/scripts/clobber.sh;~/scripts/build_aicp_T311_315.sh;tput setf 0; tput setb 7;;
      4) tput sgr0;~/scripts/clobber.sh;~/scripts/make_T310_recovery.sh;tput setf 0; tput setb 7;;
      5) tput sgr0;~/scripts/clobber.sh;~/scripts/make_T311_recovery.sh;tput setf 0; tput setb 7;;
      6) tput sgr0;~/scripts/clobber.sh;~/scripts/make_T315_recovery.sh;tput setf 0; tput setb 7;;
      7) ;;
      8) tput sgr0;~/scripts/clobber.sh;~/scripts/build_nosync.sh;tput setf 0; tput setb 7;;
      9) tput sgr0;~/scripts/clobber.sh;~/scripts/build.sh;tput setf 0; tput setb 7;;
      10) tput sgr0;~/scripts/clobber.sh;~/scripts/build_T310.sh;tput setf 0; tput setb 7;;
      11) tput sgr0;~/scripts/clobber.sh;~/scripts/build_T311.sh;tput setf 0; tput setb 7;;
      12) tput sgr0;~/scripts/clobber.sh;~/scripts/build_T315.sh;tput setf 0; tput setb 7;;
      13) tput sgr0;~/scripts/clobber.sh;~/scripts/build_T311_315.sh;tput setf 0; tput setb 7;;
      1a) tput sgr0;~/scripts/clobber.sh;~/scripts/build_bliss_nosync.sh;tput setf 0; tput setb 7;;
      2a) tput sgr0;~/scripts/clobber.sh;~/scripts/build_bliss_T310.sh;tput setf 0; tput setb 7;;
      3a) tput sgr0;~/scripts/clobber.sh;~/scripts/build_bliss_T311_315.sh;tput setf 0; tput setb 7;;
      4a) ;;
      5a) tput sgr0; ~/scripts/sync_only_aicp.sh;tput setf 0; tput setb 7;;
      5b) tput sgr0; ~/scripts/sync_only_bliss.sh;tput setf 0; tput setb 7;;
      5c) tput sgr0; ~/scripts/sync_only.sh;tput setf 0; tput setb 7;;
      g)  ;;
      cc) tput sgr0;~/scripts/clobber.sh;tput setf 0; tput setb 7;;
      m)  ;;
      ta) tput sgr0;gnome-terminal  --working-directory=/home/dave/aicp;tput setf 0; tput setb 7;;
      tb) tput sgr0;gnome-terminal  --working-directory=/home/dave/bliss;tput setf 0; tput setb 7;;
      tc) tput sgr0;gnome-terminal  --working-directory=/home/dave/cm13;tput setf 0; tput setb 7;;
      r) tput sgr0;;
      uu) ;;
      x) exit;;
    esac
  fi
done

