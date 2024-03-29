#!/bin/bash
PRODUCT="is-analytics"
VERSION="5.5.0"
_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_ENV_VARS_SCRIPT=""

product_main_menu(){
	if [ "$1" == "" ]; then
		print_help
		exit 0
	fi

	_ENV_VARS_SCRIPT=/opt/wso2/install/environments/$1/env-vars.sh
	echo "DEBUG: script de variaveis de ambiente do cliente: $_ENV_VARS_SCRIPT" 
	
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~"	
	echo " Escolha o Pattern"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "[1] Single Node"
	echo "[2] Cluster - 2 Nodes"
	echo "[0] Sair"
	read_options
}

function cluster2nodes() {

	echo "DEBUG: carregar script de instalacao do produto escolhido: $_DIR/$VERSION/install.sh"
	source $_DIR/$VERSION/install.sh

	install_$PRODUCT $_ENV_VARS_SCRIPT

}

function singleNode() {

	echo "DEBUG: carregar script de instalacao do produto escolhido: $_DIR/$VERSION/install.sh"
	source $_DIR/$VERSION/install.sh

	install_$PRODUCT $_ENV_VARS_SCRIPT

}

read_options(){
	local choice
	read -p " " choice
	case $choice in
		1) singleNode ;;
		2) cluster2nodes ;;
		0) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}