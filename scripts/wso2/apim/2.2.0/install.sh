#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function install_apim() {
    echo "configurando variaveis de ambiente padrão para o wso2 api manager 2.2.0"
    $DIR/env-vars.sh

    echo "configurando variaveis de ambiente do cliente"
    source $1

    echo "# removendo instalação anterior"
    mv $APIM_HOME $CARBON_HOME.$_DATAHORA

    echo "# descompactando binario de instalacao"
    cd /opt/wso2/
    unzip -q $WSO2AM_INSTALL_PATH
}

function backup() {
    echo "# API MANAGER #"
    echo "backup dos arquivos de configuracao original"
    echo $_DATAHORA >> executions.txt 
    echo "\n" >> executions.txt 
    cp $CARBON_HOME/repository/conf/carbon.xml $CARBON_HOME/repository/conf/carbon.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/registry.xml $CARBON_HOME/repository/conf/registry.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/api-manager.xml $CARBON_HOME/repository/conf/api-manager.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/user-mgt.xml $CARBON_HOME/repository/conf/user-mgt.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/tomcat/catalina-server.xml $CARBON_HOME/repository/conf/tomcat/catalina-server.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/axis2/axis2.xml $CARBON_HOME/repository/conf/axis2/axis2.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/datasources/master-datasources.xml $CARBON_HOME/repository/conf/datasources/master-datasources.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/datasources/metrics-datasources.xml $CARBON_HOME/repository/conf/datasources/metrics-datasources.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/deployment/server/jaggeryapps/store/site/conf/site.json $CARBON_HOME/repository/deployment/server/jaggeryapps/store/site/conf/site.json.orig.$_DATAHORA    
}

function setup() {
    echo "# substituindo arquivos de configuracao"
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/carbon.xml $CARBON_HOME/repository/conf/
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/registry.xml $CARBON_HOME/repository/conf/
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/api-manager-publisher.xml $CARBON_HOME/repository/conf/api-manager.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/user-mgt.xml $CARBON_HOME/repository/conf/
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/tomcat/catalina-server.xml $CARBON_HOME/repository/conf/tomcat/
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/axis2/axis2-publisher.xml $CARBON_HOME/repository/conf/axis2/axis2.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/datasources/master-datasources-$DB.xml $CARBON_HOME/repository/conf/datasources/master-datasources.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/datasources/metrics-datasources.xml $CARBON_HOME/repository/conf/datasources/
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/store/conf/site.json $CARBON_HOME/repository/deployment/server/jaggeryapps/store/site/conf/
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/publisher/conf/site.json $CARBON_HOME/repository/deployment/server/jaggeryapps/publisher/site/conf/
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/admin/conf/site.json $CARBON_HOME/repository/deployment/server/jaggeryapps/admin/site/conf/
    cp $JDBC_DRIVER_PATH $CARBON_HOME/repository/components/lib/    
}

function cleanup() {
    echo "apagando arquivos desnecessários para o publisher"
    rm $CARBON_HOME/repository/deployment/server/synapse-configs/default/inbound-endpoints/SecureWebSocketInboundEndpoint.xml
    rm -rf $CARBON_HOME/repository/deployment/server/jaggeryapps/store*
    rm -rf $CARBON_HOME/repository/deployment/server/webapps/api#am#store*
    rm -rf $CARBON_HOME/repository/deployment/server/webapps/throttle#data*
    rm -rf $CARBON_HOME/repository/deployment/server/webapps/api#identity#consent-mgt*
    rm -rf $CARBON_HOME/repository/deployment/server/webapps/oauth2*
    rm -rf $CARBON_HOME/repository/deployment/server/webapps/client-registration*
    rm -rf $CARBON_HOME/repository/deployment/server/webapps/client-registration*    
}

function postConfig() {
    if [ $1 = "mysql57" ]
    then
        echo "atualizando scripts mysql-5.7"
        mv $CARBON_HOME/dbscripts/mysql.sql $CARBON_HOME/dbscripts/mysql5.x.sql
        mv $CARBON_HOME/dbscripts/mysql5.7.sql $CARBON_HOME/dbscripts/mysql.sql
        mv $CARBON_HOME/dbscripts/apimgt/mysql.sql $CARBON_HOME/dbscripts/apimgt/mysql5.x.sql
        mv $CARBON_HOME/dbscripts/apimgt/mysql5.7.sql $CARBON_HOME/dbscripts/apimgt/mysql.sql
    fi    
}
