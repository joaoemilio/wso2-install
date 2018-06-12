#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function backup() {
    echo "backup dos arquivos de configuracao original"
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
    echo "substituindo arquivos de configuracao"
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
    echo "nada para apagar"
}

function postConfig() {
    source $1

    if [ "$2" = "mysql57" ]
    then
        echo "atualizando scripts mysql-5.7"
        mv -v $CARBON_HOME/dbscripts/mysql.sql $CARBON_HOME/dbscripts/mysql5.x.sql
        mv -v $CARBON_HOME/dbscripts/mysql5.7.sql $CARBON_HOME/dbscripts/mysql.sql
        mv -v $CARBON_HOME/dbscripts/apimgt/mysql.sql $CARBON_HOME/dbscripts/apimgt/mysql5.x.sql
        mv -v $CARBON_HOME/dbscripts/apimgt/mysql5.7.sql $CARBON_HOME/dbscripts/apimgt/mysql.sql
    fi  
}


function install_apim-analytics() {
    echo "configurando variaveis de ambiente padrão para o WSO2 API Manager - Analytics 2.2.0"
    source $DIR/env-vars.sh

    echo "configurando variaveis de ambiente do cliente: $1"
    source $1

    echo "substituindo variaveis nos arquivos configuracao template"
    source $WSO2_INSTALL_PATH/scripts/functions.sh
    pre_install $1 $DIR/env-vars.sh

    echo "# removendo instalação anterior"
    mv $APIM_HOME $CARBON_HOME.$_DATAHORA

    echo "# descompactando binario de instalacao: $WSO2AM_INSTALL_PATH"
    cd /opt/wso2/
    ln -s $APIM_HOME wso2analytics
    unzip -q $WSO2AM_INSTALL_PATH

    backup $1
    setup $1
    cleanup $1
    postConfig $1
}


