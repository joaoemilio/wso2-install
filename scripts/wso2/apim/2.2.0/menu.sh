#!/bin/bash

product_main_menu(){
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~"	
	echo " Escolha o Pattern"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "[1] Pattern #1 - 2 all-in-one nodes"
	echo "[2] Pattern #2 - Distributed Gateways and Key Manager"
	echo "[3] Pattern #3 - Fully Distributed"
	echo "[4] Pattern #4 - Fully Distributed with Internal Gateways"
	echo "[5] Pattern #5 - Hybrid (API Cloud +On Premise)"
	echo "[0] Sair"
	read_options_one
}

read_options_one(){
	local choice
	read -p " " choice
	case $choice in
		1) echo "pattern 1" ;;
		2) echo "pattern 2" ;;
		3) echo "pattern 3" ;;
		4) echo "pattern 4" ;;
		5) echo "pattern 5" ;;
		0) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}