#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function backup() {
    echo "INFO: backup dos arquivos de configuracao original"
    cp $CARBON_HOME/repository/conf/carbon.xml $CARBON_HOME/repository/conf/carbon.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/registry.xml $CARBON_HOME/repository/conf/registry.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/user-mgt.xml $CARBON_HOME/repository/conf/user-mgt.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/identity/identity.xml $CARBON_HOME/repository/conf/identity/identity.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/tomcat/catalina-server.xml $CARBON_HOME/repository/conf/tomcat/catalina-server.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/datasources/master-datasources.xml $CARBON_HOME/repository/conf/datasources/master-datasources.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/datasources/analytics-datasources.xml $CARBON_HOME/repository/conf/datasources/analytics-datasources.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/datasources/stats-datasources.xml $CARBON_HOME/repository/conf/datasources/analytics-datasources.xml.orig.$_DATAHORA
}

function setup() {
    echo "INFO: substituindo arquivos de configuracao"
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/carbon.xml $CARBON_HOME/repository/conf/
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/registry.xml $CARBON_HOME/repository/conf/registry.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/user-mgt.xml $CARBON_HOME/repository/conf/user-mgt.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/identity/identity.xml $CARBON_HOME/repository/conf/identity/identity.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/tomcat/catalina-server.xml $CARBON_HOME/repository/conf/tomcat/catalina-server.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/datasources/master-datasources-$DB.xml $CARBON_HOME/repository/conf/datasources/master-datasources.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/datasources/stats-datasources-$DB.xml $CARBON_HOME/repository/conf/datasources/stats-datasources.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/datasources/analytics-datasources-$DB.xml $CARBON_HOME/repository/conf/datasources/analytics-datasources.xml
    cp $JDBC_DRIVER_PATH $CARBON_HOME/repository/components/lib/
}

function cleanup() {
    echo "INFO: nada para apagar"
}

function postConfig() {
    source $1

    if [ "$2" = "mysql57" ]
    then
        echo "INFO: atualizando scripts mysql-5.7"
        mv -v $CARBON_HOME/dbscripts/mysql.sql $CARBON_HOME/dbscripts/mysql5.x.sql
        mv -v $CARBON_HOME/dbscripts/mysql5.7.sql $CARBON_HOME/dbscripts/mysql.sql
        mv -v $CARBON_HOME/dbscripts/apimgt/mysql.sql $CARBON_HOME/dbscripts/apimgt/mysql5.x.sql
        mv -v $CARBON_HOME/dbscripts/apimgt/mysql5.7.sql $CARBON_HOME/dbscripts/apimgt/mysql.sql
    fi  
}


function install_is-analytics() {
    echo "INFO: configurando variaveis de ambiente padrão para o WSO2 Identity Server - Analytics 5.5.0"
    source $DIR/env-vars.sh

    echo "DEBUG: configurando variaveis de ambiente do cliente: $1"
    source $1

    echo "INFO: substituindo variaveis nos arquivos configuracao template"
    source $WSO2_INSTALL_PATH/scripts/functions.sh
    pre_install $1 $DIR/env-vars.sh

    echo "INFO: removendo instalação anterior"
    mv $APIM_HOME $CARBON_HOME.$_DATAHORA

    echo "INFO: descompactando binario de instalacao: $WSO2AM_INSTALL_PATH"
    cd /opt/wso2/
    unzip -q $WSO2AM_INSTALL_PATH
    ln -s $APIM_HOME wso2analytics

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


