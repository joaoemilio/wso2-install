#!/bin/bash
# A menu driven shell script sample template 
## ----------------------------------
# Step #1: Define variables
# ----------------------------------
RED='\033[0;41;30m'
STD='\033[0;0;39m'
 
# ----------------------------------
# Step #2: User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

# do something in two()
two(){
	echo "two() called"
        pause
}
 
# function to display menus
show_main_menu() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~"	
	echo " Escolha o Produto WSO2"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "[1] WSO2 API Manager 2.6.0"
	echo "[2] WSO2 Identity Server 5.7.0"
	echo "[3] WSO2 API-M Analytics 2.6.0"
	echo "[4] WSO2 IS Analytics 5.7.0"
	echo "[0] Sair"
}

