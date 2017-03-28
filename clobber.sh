while :
do


  echo 
  echo "============================================================"
  echo "    gr8nole's Clobber Menu            >>>>--------;;;----->"
  echo "============================================================"
  echo 
  echo "> CLOBBER MENU"
  echo
echo " aa. - Clobber All"
echo " a. - "
echo " b. - Clobber cdDroid"
echo " c. - Clobber Lineage"
echo " n. - NO - DON'T CLOBBER"

  echo 
  echo -n "Enter option: "
  echo 
  echo 
  echo 
  echo 
  echo 
  echo 
  echo 
  echo   
  echo 
  echo 
  echo 
  read opt
if [ "$?" != "1" ]
  then
    case $opt in
      aa) tput sgr0;~/$scriptsdir/make_clobber_all.sh;exit;;
      a) ;;
      b) tput sgr0;~/$scriptsdir/make_clobber_crdroid.sh;exit;;
      c) tput sgr0;~/$scriptsdir/make_clobber.sh;exit;;
      n) tput sgr0;exit;;
     esac
  fi
done

