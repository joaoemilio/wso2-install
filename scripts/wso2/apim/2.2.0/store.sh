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
    cp $CARBON_HOME/repository/deployment/server/jaggeryapps/store/site/conf/site.json $CARBON_HOME/repository/deployment/server/jaggeryapps/store/site/conf/site.json.orig.$_DATAHORA
}

function setup() {
    source $1
    
    echo "substituindo arquivos de configuracao"
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/carbon-store.xml $CARBON_HOME/repository/conf/carbon.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/registry-store.xml $CARBON_HOME/repository/conf/registry.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/api-manager-store.xml $CARBON_HOME/repository/conf/api-manager.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/user-mgt.xml $CARBON_HOME/repository/conf/
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/tomcat/catalina-server.xml $CARBON_HOME/repository/conf/tomcat/
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/axis2/axis2-store.xml $CARBON_HOME/repository/conf/axis2/axis2.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/datasources/master-datasources-$DB.xml $CARBON_HOME/repository/conf/datasources/master-datasources.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/datasources/metrics-datasources.xml $CARBON_HOME/repository/conf/datasources/
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/store/conf/site.json $CARBON_HOME/repository/deployment/server/jaggeryapps/store/site/conf/
    cp $JDBC_DRIVER_PATH $CARBON_HOME/repository/components/lib/    
}

function cleanup() {
    source $1

    echo "apagando arquivos desnecessários para a store"
    rm $CARBON_HOME/repository/deployment/server/synapse-configs/default/inbound-endpoints/SecureWebSocketInboundEndpoint.xml
    rm -rf $CARBON_HOME/repository/deployment/server/jaggeryapps/publisher 
    rm -rf $CARBON_HOME/repository/deployment/server/jaggeryapps/admin 
    rm -rf $CARBON_HOME/repository/deployment/server/webapps/throttle*
    rm -rf $CARBON_HOME/repository/deployment/server/webapps/oauth2*
    rm -rf $CARBON_HOME/repository/deployment/server/webapps/client-registration*
    rm -rf $CARBON_HOME/repository/deployment/server/webapps/api#am#publisher*
    rm -rf $CARBON_HOME/repository/deployment/server/webapps/api#am#admin*
    rm -rf $CARBON_HOME/repository/deployment/server/webapps/am#sample#pizzashack*
    rm -rf $CARBON_HOME/repository/deployment/server/webapps/micro-gateway*
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