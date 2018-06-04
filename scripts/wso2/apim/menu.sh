#!/bin/bash
PRODUCT="apim"
VERSION="2.2.0"
_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function install_product() {
	source $_DIR/$VERSION/install.sh
	install_$PRODUCT
}

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

function pattern3() {
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~"	
	echo " Escolha o Product Profile"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "[1] All In One"
	echo "[2] API Publisher / Admin"
	echo "[3] API Store"
	echo "[4] Gateway"
	echo "[5] Traffic Manager"
	echo "[0] Sair"
	local choice

	read -p " " choice
	case $choice in
		1) echo "All In One (pending)" ;;
		2) echo "API Publisher (pending)"; install_product $PRODUCT $VERSION "publisher";;
		3) echo "API Store (pending)" ;;
		4) echo "Gateway (pending)" ;;
		5) echo "Traffic Manager" ;;
		0) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}

read_options_one(){
	local choice
	read -p " " choice
	case $choice in
		1) echo "pattern 1" ;;
		2) echo "pattern 2" ;;
		3) pattern3 ;;
		4) echo "pattern 4" ;;
		5) echo "pattern 5" ;;
		0) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}