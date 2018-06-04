#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CUSTOMER_ENV_SCRIPT=$1

function product_menu() {
    _product=$1
    source $DIR/wso2/$_product/menu.sh 
    product_main_menu $CUSTOMER_ENV_SCRIPT
}

read_options(){
	local choice
	read -p " " choice
	case $choice in
		1) product_menu "apim" ;;
		0) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}

function print_help() {
    echo "O script para setar as variaveis de ambiente é obritatório"
    echo "Sintaxe: sh install.sh /opt/wso2/install/environments/dev/env-vars.sh"
}

if [ "$1" == "" ]; then
    print_help
    exit 0
fi

source $DIR/menu.sh 
show_main_menu
read_options