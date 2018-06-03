#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function install() {
    echo "(re)criando diretorio com os artefatos /tmp/resources"
    rm -rf $RESOURCES_HOME
    mkdir -p $RESOURCES_HOME
    cp -av $WSO2_INSTALL_PATH/resources/* $RESOURCES_HOME/

    echo "substituindo variaveis nos arquivos configuracao template"
    source $WSO2_INSTALL_PATH/resources/functions.sh
    replaceVars $RESOURCES_HOME 
}

function install_apim_220() {
    source $DIR/wso2/apim/2.2.0/menu.sh 
    product_main_menu
}

read_options(){
	local choice
	read -p " " choice
	case $choice in
		1) install_apim_220 ;;
		0) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}

source $DIR/menu.sh 
show_main_menu
read_options