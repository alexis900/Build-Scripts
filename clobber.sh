while :
do
  clear

  echo 
  echo "============================================================"
  echo "    gr8nole's Clobber Menu            >>>>--------;;;----->"
  echo "============================================================"
  echo 
  echo "> CLOBBER MENU"
  echo
echo " aa. - Clobber All"
echo " a. - Clobber AICP"
echo " b. - Clobber Bliss"
echo " c. - Clobber CM13"
echo " n. - NO - DON'T CLOBBER"

  echo 
  echo -n "Enter option: "
  read opt
if [ "$?" != "1" ]
  then
    case $opt in
      aa) tput sgr0;~/scripts/make_clobber_all.sh;exit;;
      a) tput sgr0;~/scripts/make_clobber_aicp.sh;exit;;
      b) tput sgr0;~/scripts/make_clobber_bliss.sh;exit;;
      c) tput sgr0;~/scripts/make_clobber.sh;exit;;
      n) tput sgr0;exit;;
     esac
  fi
done

