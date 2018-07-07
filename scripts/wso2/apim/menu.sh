#!/bin/bash
PRODUCT="apim"
VERSION="2.2.0"
_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_ENV_VARS_SCRIPT=""

read_options_one(){
	local choice
	read -p " " choice
	case $choice in
		1) pattern1 ;;
		2) echo "pattern 2" ;;
		3) pattern3 ;;
		4) echo "pattern 4" ;;
		5) echo "pattern 5" ;;
		0) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}

function pattern1() {
	echo "carregar script de instalacao do produto escolhido: $_DIR/$VERSION/install.sh"
	source $_DIR/$VERSION/install.sh

	install_$PRODUCT $_ENV_VARS_SCRIPT "all-in-one"
}

function pattern3() {
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~"	
	echo " Escolha o Product Profile"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "[1] API Publisher / Admin"
	echo "[2] API Store"
	echo "[3] Gateway"
	echo "[4] Traffic Manager"
	echo "[0] Sair"
	local choice

	echo "carregar script de instalacao do produto escolhido: $_DIR/$VERSION/install.sh"
	source $_DIR/$VERSION/install.sh

	read -p " " choice
	case $choice in
		1) install_$PRODUCT $_ENV_VARS_SCRIPT "publisher";;
		2) install_$PRODUCT $_ENV_VARS_SCRIPT "store" ;;
		3) install_$PRODUCT $_ENV_VARS_SCRIPT "gateway" ;;
		4) install_$PRODUCT $_ENV_VARS_SCRIPT "traffic-manager" ;;
		0) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}

read_options_one(){
	local choice
	read -p " " choice
	case $choice in
		1) pattern1 ;;
		2) echo "pattern 2" ;;
		3) pattern3 ;;
		4) echo "pattern 4" ;;
		5) echo "pattern 5" ;;
		0) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}

product_main_menu(){
	if [ "$1" == "" ]; then
		print_help
		exit 0
	fi
	_ENV_VARS_SCRIPT=/opt/wso2/install/environments/$1/env-vars.sh
	echo "script de variaveis de ambiente do cliente: $_ENV_VARS_SCRIPT" 
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
