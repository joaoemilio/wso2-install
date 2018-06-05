#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function install_apim() {
    echo "configurando variaveis de ambiente padrão para o wso2 api manager 2.2.0"
    source $DIR/env-vars.sh

    echo "configurando variaveis de ambiente do cliente: $1"
    source $1

    echo "script do profile de apim a ser instalado: $2"
    source $DIR/$2.sh 

    echo "substituindo variaveis nos arquivos configuracao template"
    source $WSO2_INSTALL_PATH/scripts/functions.sh
    pre_install

    echo "# removendo instalação anterior"
    mv $APIM_HOME $CARBON_HOME.$_DATAHORA

    echo "# descompactando binario de instalacao: $WSO2AM_INSTALL_PATH"
    cd /opt/wso2/
    unzip -q $WSO2AM_INSTALL_PATH

    backup
    setup
    cleanup
    postConfig
}


