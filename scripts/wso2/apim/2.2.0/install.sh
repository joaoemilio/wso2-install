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
    pre_install $1 $DIR/env-vars.sh

    echo "# removendo instalação anterior"
    mv $APIM_HOME $CARBON_HOME.$_DATAHORA

    echo "# descompactando binario de instalacao: $WSO2AM_INSTALL_PATH"
    cd /opt/wso2/
    ln -s $APIM_HOME wso2apim 
    unzip -q $WSO2AM_INSTALL_PATH

    backup $1
    setup $1
    cleanup $1
    postConfig $1

    if [ "$LOG_ROTATION_TYPE" = "size" ]; then
        cp -v $CARBON_HOME/repository/conf/log4j.properties $CARBON_HOME/repository/conf/log4j.properties.orig

        FILE=$RESOURCES_HOME/$PRODUCT/$VERSION/conf/log4j-$LOG_ROTATION_TYPE-rotation.properties
        cp -v $FILE $CARBON_HOME/repository/conf/log4j.properties

        FILE=$CARBON_HOME/repository/conf/log4j.properties
        if [ "$LOG_ROTATION_TYPE" = "size" ]; then
            sed -i "s,{{CARBON_LOGFILE_MAXFILESIZE}},$CARBON_LOGFILE_MAXFILESIZE,g" $FILE
            sed -i "s,{{CARBON_LOGFILE_MAXBACKUPINDEX}},$CARBON_LOGFILE_MAXBACKUPINDEX,g" $FILE
        fi                
    fi

    if [ -d $SERVER_FILESYSTEM ]; then
        echo "DIRETORIO SERVER JÁ EXISTE. CRIANDO BACKUP"
        mv $SERVER_FILESYSTEM $SERVER_FILESYSTEM.$_DATAHORA
    fi
    
    cp -a $APIM_HOME/repository/deployment/server-original $SERVER_FILESYSTEM

    if [ ! -d $APIM_HOME/repository/deployment/server ]; then
        echo "Diretorio 'server' nao existe dentro do repository/deployment"
    fi
}


