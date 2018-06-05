#!/bin/bash
PRODUCT="is-as-km"
VERSION="5.5.0"
_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_ENV_VARS_SCRIPT=""

product_main_menu(){
	if [ "$1" == "" ]; then
		print_help
		exit 0
	fi
	_ENV_VARS_SCRIPT=$1
	echo "script de variaveis de ambiente do cliente: $_ENV_VARS_SCRIPT" 
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~"	
	echo " Escolha o Pacote"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "[1] WSO2 Identity Server as Key Manager"
	echo "[0] Sair"
	local choice

	echo "carregar script de instalacao do produto escolhido: $_DIR/$VERSION/install.sh"
	source $_DIR/$VERSION/install.sh

	read -p " " choice
	case $choice in
		1) install_$PRODUCT $_ENV_VARS_SCRIPT ;;
		0) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}
