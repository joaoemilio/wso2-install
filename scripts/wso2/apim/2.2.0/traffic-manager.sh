function backup() {

    source $1

    echo "backup dos arquivos de configuracao original"
    cp $CARBON_HOME/repository/conf/carbon.xml $CARBON_HOME/repository/conf/carbon.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/registry.xml $CARBON_HOME/repository/conf/registry.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/api-manager.xml $CARBON_HOME/repository/conf/api-manager.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/user-mgt.xml $CARBON_HOME/repository/conf/user-mgt.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/tomcat/catalina-server.xml $CARBON_HOME/repository/conf/tomcat/catalina-server.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/axis2/axis2.xml $CARBON_HOME/repository/conf/axis2/axis2.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/datasources/master-datasources.xml $CARBON_HOME/repository/conf/datasources/master-datasources.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/datasources/metrics-datasources.xml $CARBON_HOME/repository/conf/datasources/metrics-datasources.xml.orig.$_DATAHORA
    
}

function setup() {
    source $1
    
    echo "substituindo arquivos de configuracao"
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/carbon-tm.xml $CARBON_HOME/repository/conf/
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/registry-tm.xml $CARBON_HOME/repository/conf/registry.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/api-manager-tm.xml $CARBON_HOME/repository/conf/api-manager.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/user-mgt.xml $CARBON_HOME/repository/conf/
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/tomcat/catalina-server.xml $CARBON_HOME/repository/conf/tomcat/
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/axis2/axis2-tm.xml $CARBON_HOME/repository/conf/axis2/axis2.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/datasources/master-datasources-$DB.xml $CARBON_HOME/repository/conf/datasources/master-datasources.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/datasources/metrics-datasources.xml $CARBON_HOME/repository/conf/datasources/
    cp $JDBC_DRIVER_PATH $CARBON_HOME/repository/components/lib/
 
    mv $CARBON_HOME/repository/deployment/server $CARBON_HOME/repository/deployment/server-original
    ln -s $SERVER_FILESYSTEM $CARBON_HOME/repository/deployment/server
     
}

function cleanup() {
    source $1

    echo "apagando arquivos desnecessários para o traffic manager"
    rm $CARBON_HOME/repository/deployment/server-original/synapse-configs/default/inbound-endpoints/SecureWebSocketInboundEndpoint.xml
    rm -rf $CARBON_HOME/repository/deployment/server-original/jaggeryapps/* 
    rm -rf $CARBON_HOME/repository/deployment/server-original/webapps/*
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