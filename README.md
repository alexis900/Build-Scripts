Build-Scripts
=============

Personal build scripts

To make use of these scripts:
1.  Open a terminal session in your home directory and enter the following command:
    git clone https://github.com/gr8nole/Build-Scripts.git scripts
2.  Open the ~/scripts folder and "run in terminal" the Build_Menu.sh
3.  Make selections from the menu.

Notes:
1.  The above git clone command will create a folder named "scripts" in your home directory (~/scripts).
2.  If you choose to use another name/location for the scripts folder, open the Build_Menu.sh and edit the "scriptsdir" variable in the second line to reflect the new name/location.
3.  Use the SetupCM13.sh to install all necessary components to build CM13 for T31x on a clean Ubuntu install.  You will need to monitor this process and answer a few questions in terminal when some things are installed.  It will take a very long time (several hours) to do the initial repo sync of CM sources.  Reboot after the SetupCM13.sh finishes.
4.  The sync scripts will first sync projects from the official source git, then merge or cherry-pick any other required commits.
