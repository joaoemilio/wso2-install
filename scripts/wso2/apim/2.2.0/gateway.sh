function backup() {

    source $1

    echo "backup dos arquivos de configuracao original"
    cp $CARBON_HOME/repository/conf/carbon.xml $CARBON_HOME/repository/conf/carbon.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/registry.xml $CARBON_HOME/repository/conf/registry.xml.orig.$_DATAHORA
    cp $CARBON_HOME/repository/conf/api-manager.xml $CARBON_HOME/repository/conf/api-manager.xml.orig.$_DATAHORA

    cp $CARBON_HOME/repository/conf/axis2/axis2_client.xml $CARBON_HOME/repository/conf/axis2/axis2_client.xml.$_DATAHORA
    cp $CARBON_HOME/repository/conf/nhttp.properties $CARBON_HOME/repository/conf/nhttp.properties.$_DATAHORA
    cp $CARBON_HOME/repository/conf/passthru-http.properties  $CARBON_HOME/repository/conf/passthru-http.properties.$_DATAHORA
}

function setup() {
    source $1
    
    echo "substituindo arquivos de configuracao"
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/carbon-gw.xml $CARBON_HOME/repository/conf/carbon.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/registry-gw.xml $CARBON_HOME/repository/conf/registry.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/api-manager-gw.xml $CARBON_HOME/repository/conf/api-manager.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/axis2/axis2_client.xml $CARBON_HOME/repository/conf/axis2/axis2_client.xml
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/nhttp.properties $CARBON_HOME/repository/conf/nhttp.properties
    cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/passthru-http.properties  $CARBON_HOME/repository/conf/passthru-http.properties

}

function cleanup() {
    source $1

    echo "apagando arquivos desnecessários para o gateway"
    rm $CARBON_HOME/repository/deployment/server/synapse-configs/default/inbound-endpoints/SecureWebSocketInboundEndpoint.xml
    rm -rf $CARBON_HOME/repository/deployment/server/jaggeryapps/* 
    rm -rf $CARBON_HOME/repository/deployment/server/jaggeryapps/store 
    rm -rf $CARBON_HOME/repository/deployment/server/webapps/throttle*
    rm -rf $CARBON_HOME/repository/deployment/server/webapps/oauth2*
    rm -rf $CARBON_HOME/repository/deployment/server/webapps/client-registration*
    rm -rf $CARBON_HOME/repository/deployment/server/webapps/api#*
    rm -rf $CARBON_HOME/repository/deployment/server/webapps/micro-*
}

function postConfig() {
    source $1

    if [ "$1" = "mysql57" ]
    then
        echo "atualizando scripts mysql-5.7"
        mv -v $CARBON_HOME/dbscripts/mysql.sql $CARBON_HOME/dbscripts/mysql5.x.sql
        mv -v $CARBON_HOME/dbscripts/mysql5.7.sql $CARBON_HOME/dbscripts/mysql.sql
        mv -v $CARBON_HOME/dbscripts/apimgt/mysql.sql $CARBON_HOME/dbscripts/apimgt/mysql5.x.sql
        mv -v $CARBON_HOME/dbscripts/apimgt/mysql5.7.sql $CARBON_HOME/dbscripts/apimgt/mysql.sql
    fi    
}