function backup() {

    source $1

    echo "# API MANAGER #"
    echo "backup dos arquivos de configuracao original"
    echo $_DATAHORA >> executions.txt 
    echo "\n" >> executions.txt 
    cp -v $CARBON_HOME/repository/conf/carbon.xml $CARBON_HOME/repository/conf/carbon.xml.orig.$_DATAHORA
    cp -v $CARBON_HOME/repository/conf/registry.xml $CARBON_HOME/repository/conf/registry.xml.orig.$_DATAHORA
    cp -v $CARBON_HOME/repository/conf/api-manager.xml $CARBON_HOME/repository/conf/api-manager.xml.orig.$_DATAHORA
    cp -v $CARBON_HOME/repository/conf/user-mgt.xml $CARBON_HOME/repository/conf/user-mgt.xml.orig.$_DATAHORA
    cp -v $CARBON_HOME/repository/conf/tomcat/catalina-server.xml $CARBON_HOME/repository/conf/tomcat/catalina-server.xml.orig.$_DATAHORA
    cp -v $CARBON_HOME/repository/conf/axis2/axis2.xml $CARBON_HOME/repository/conf/axis2/axis2.xml.orig.$_DATAHORA
    cp -v $CARBON_HOME/repository/conf/datasources/master-datasources.xml $CARBON_HOME/repository/conf/datasources/master-datasources.xml.orig.$_DATAHORA
    cp -v $CARBON_HOME/repository/conf/datasources/metrics-datasources.xml $CARBON_HOME/repository/conf/datasources/metrics-datasources.xml.orig.$_DATAHORA
    cp -v $CARBON_HOME/repository/deployment/server/jaggeryapps/store/site/conf/site.json $CARBON_HOME/repository/deployment/server/jaggeryapps/store/site/conf/site.json.orig.$_DATAHORA    
    
}

function setup() {
    source $1
    
    echo "# substituindo arquivos de configuracao"
    cp -v $RESOURCES_HOME/$PRODUCT/$VERSION/conf/carbon-publisher.xml $CARBON_HOME/repository/conf/carbon.xml
    cp -v $RESOURCES_HOME/$PRODUCT/$VERSION/conf/registry-publisher.xml $CARBON_HOME/repository/conf/registry.xml
    cp -v $RESOURCES_HOME/$PRODUCT/$VERSION/conf/api-manager-publisher.xml $CARBON_HOME/repository/conf/api-manager.xml
    cp -v $RESOURCES_HOME/$PRODUCT/$VERSION/conf/user-mgt.xml $CARBON_HOME/repository/conf/
    cp -v $RESOURCES_HOME/$PRODUCT/$VERSION/conf/tomcat/catalina-server.xml $CARBON_HOME/repository/conf/tomcat/
    cp -v $RESOURCES_HOME/$PRODUCT/$VERSION/conf/axis2/axis2-publisher.xml $CARBON_HOME/repository/conf/axis2/axis2.xml
    cp -v $RESOURCES_HOME/$PRODUCT/$VERSION/conf/datasources/master-datasources-$DB.xml $CARBON_HOME/repository/conf/datasources/master-datasources.xml
    cp -v $RESOURCES_HOME/$PRODUCT/$VERSION/conf/datasources/metrics-datasources.xml $CARBON_HOME/repository/conf/datasources/
    cp -v $RESOURCES_HOME/$PRODUCT/$VERSION/store/conf/site.json $CARBON_HOME/repository/deployment/server/jaggeryapps/store/site/conf/
    cp -v $RESOURCES_HOME/$PRODUCT/$VERSION/publisher/conf/site.json $CARBON_HOME/repository/deployment/server/jaggeryapps/publisher/site/conf/
    cp -v $RESOURCES_HOME/$PRODUCT/$VERSION/admin/conf/site.json $CARBON_HOME/repository/deployment/server/jaggeryapps/admin/site/conf/
    cp -v $JDBC_DRIVER_PATH $CARBON_HOME/repository/components/lib/    

    mv $CARBON_HOME/repository/deployment/server $CARBON_HOME/repository/deployment/server-original
    ln -s $SERVER_FILESYSTEM $CARBON_HOME/repository/deployment/server
    
}

function cleanup() {
    source $1

    echo "apagando arquivos desnecessários para o publisher"
    rm $CARBON_HOME/repository/deployment/server-original/synapse-configs/default/inbound-endpoints/SecureWebSocketInboundEndpoint.xml
    rm -rf $CARBON_HOME/repository/deployment/server-original/jaggeryapps/store*
    rm -rf $CARBON_HOME/repository/deployment/server-original/webapps/api#am#store*
    rm -rf $CARBON_HOME/repository/deployment/server-original/webapps/throttle#data*
    rm -rf $CARBON_HOME/repository/deployment/server-original/webapps/api#identity#consent-mgt*
    rm -rf $CARBON_HOME/repository/deployment/server-original/webapps/oauth2*
    rm -rf $CARBON_HOME/repository/deployment/server-original/webapps/client-registration*
}

function postConfig() {
    source $1

    if [ "$DB" = "mysql-5.7" ]
    then
        echo "atualizando scripts mysql-5.7"
        mv -v $CARBON_HOME/dbscripts/mysql.sql $CARBON_HOME/dbscripts/mysql5.x.sql
        mv -v $CARBON_HOME/dbscripts/mysql5.7.sql $CARBON_HOME/dbscripts/mysql.sql
        mv -v $CARBON_HOME/dbscripts/apimgt/mysql.sql $CARBON_HOME/dbscripts/apimgt/mysql5.x.sql
        mv -v $CARBON_HOME/dbscripts/apimgt/mysql5.7.sql $CARBON_HOME/dbscripts/apimgt/mysql.sql
    fi    
}