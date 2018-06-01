function replaceVars( ) {

echo "resources home = $1"
    cd $1
    find ./apim ./apim-analytics ./is-as-km ./nginx ./centos7 ./is-analytics -type f | while read FILE
    do
    echo "atualizando arquivo $FILE"
    sed -i "s,{{DB_MAX_ACTIVE}},$DB_MAX_ACTIVE,g" $FILE
    sed -i "s,{{CARBON_HOSTNAME}},$CARBON_HOSTNAME,g" $FILE
    sed -i "s,{{CARBON_MGT_HOSTNAME}},$CARBON_MGT_HOSTNAME,g" $FILE
    sed -i "s,{{WSO2AM_DB_JDBC_URL}},$WSO2AM_DB_JDBC_URL,g" $FILE
    sed -i "s,{{WSO2AM_DB_USERNAME}},$WSO2AM_DB_USERNAME,g" $FILE
    sed -i "s,{{WSO2AM_DB_PASSWORD}},$WSO2AM_DB_PASSWORD,g" $FILE
    sed -i "s,{{WSO2AM_DB_JDBC_DRIVER_CLASS_NAME}},$WSO2AM_DB_JDBC_DRIVER_CLASS_NAME,g" $FILE
    sed -i "s,{{WSO2AM_STAT_DB_JDBC_URL}},$WSO2AM_STAT_DB_JDBC_URL,g" $FILE
    sed -i "s,{{WSO2AM_STAT_DB_USERNAME}},$WSO2AM_STAT_DB_USERNAME,g" $FILE
    sed -i "s,{{WSO2AM_STAT_DB_PASSWORD}},$WSO2AM_STAT_DB_PASSWORD,g" $FILE
    sed -i "s,{{WSO2AM_STAT_DB_JDBC_DRIVER_CLASS_NAME}},$WSO2AM_STAT_DB_JDBC_DRIVER_CLASS_NAME,g" $FILE
    sed -i  "s,{{WSO2_MB_STORE_DB_JDBC_URL}},$WSO2_MB_STORE_DB_JDBC_URL,g" $FILE
    sed -i  "s,{{WSO2_MB_STORE_DB_USERNAME}},$WSO2_MB_STORE_DB_USERNAME,g" $FILE
    sed -i  "s,{{WSO2_MB_STORE_DB_PASSWORD}},$WSO2_MB_STORE_DB_PASSWORD,g" $FILE
    sed -i  "s,{{WSO2_MB_STORE_DB_JDBC_DRIVER_CLASS_NAME}},$WSO2_MB_STORE_DB_JDBC_DRIVER_CLASS_NAME,g" $FILE
    sed -i  "s,{{WSO2_METRICS_DB_JDBC_URL}},$WSO2_METRICS_DB_JDBC_URL,g" $FILE
    sed -i  "s,{{WSO2_METRICS_DB_USERNAME}},$WSO2_METRICS_DB_USERNAME,g" $FILE
    sed -i  "s,{{WSO2_METRICS_DB_PASSWORD}},$WSO2_METRICS_DB_PASSWORD,g" $FILE
    sed -i  "s,{{WSO2_METRICS_DB_JDBC_DRIVER_CLASS_NAME}},$WSO2_METRICS_DB_JDBC_DRIVER_CLASS_NAME,g" $FILE
    sed -i  "s,{{CARBON_DB_JDBC_URL}},$CARBON_DB_JDBC_URL,g" $FILE
    sed -i  "s,{{CARBON_DB_USERNAME}},$CARBON_DB_USERNAME,g" $FILE
    sed -i  "s,{{CARBON_DB_PASSWORD}},$CARBON_DB_PASSWORD,g" $FILE
    sed -i "s,{{CARBON_DB_JDBC_DRIVER_CLASS_NAME}},$CARBON_DB_JDBC_DRIVER_CLASS_NAME,g" $FILE
    sed -i  "s,{{WSO2UM_DB_JDBC_URL}},$WSO2UM_DB_JDBC_URL,g" $FILE
    sed -i  "s,{{WSO2UM_DB_USERNAME}},$WSO2UM_DB_USERNAME,g" $FILE
    sed -i  "s,{{WSO2UM_DB_PASSWORD}},$WSO2UM_DB_PASSWORD,g" $FILE
    sed -i "s,{{WSO2UM_DB_JDBC_DRIVER_CLASS_NAME}},$WSO2UM_DB_JDBC_DRIVER_CLASS_NAME,g" $FILE
    sed -i  "s,{{WSO2GOV_DB_JDBC_URL}},$WSO2GOV_DB_JDBC_URL,g" $FILE
    sed -i  "s,{{WSO2GOV_DB_USERNAME}},$WSO2GOV_DB_USERNAME,g" $FILE
    sed -i  "s,{{WSO2GOV_DB_PASSWORD}},$WSO2GOV_DB_PASSWORD,g" $FILE
    sed -i "s,{{WSO2GOV_DB_JDBC_DRIVER_CLASS_NAME}},$WSO2GOV_DB_JDBC_DRIVER_CLASS_NAME,g" $FILE
    sed -i  "s,{{IS_AS_KM_HOSTNAME}},$IS_AS_KM_HOSTNAME,g" $FILE
    sed -i  "s,{{IS_AS_KM_PORT}},$IS_AS_KM_PORT,g" $FILE
    sed -i "s,{{IS_ANALYTICS_ENABLED}},$IS_ANALYTICS_ENABLED,g" $FILE
    sed -i "s,{{IS_ANALYTICS_API_URL}},$IS_ANALYTICS_API_URL,g" $FILE
    sed -i "s,{{IS_ANALYTICS_SERVER_URL}},$IS_ANALYTICS_SERVER_URL,g" $FILE
    sed -i  "s,{{WSO2IS_ANALYTICS_HOSTNAME}},$WSO2IS_ANALYTICS_HOSTNAME,g" $FILE
    sed -i  "s,{{WSO2IS_ANALYTICS_PORT}},$WSO2IS_ANALYTICS_PORT,g" $FILE
    sed -i  "s,{{WSO2AM_ANALYTICS_HOSTNAME}},$WSO2AM_ANALYTICS_HOSTNAME,g" $FILE
    sed -i  "s,{{WSO2AM_ANALYTICS_PORT}},$WSO2AM_ANALYTICS_PORT,g" $FILE
    sed -i  "s,{{WSO2AM_HOSTNAME}},$WSO2AM_HOSTNAME,g" $FILE
    sed -i  "s,{{APIGATEWAY_URL}},$APIGATEWAY_URL,g" $FILE
    sed -i  "s,{{APIGATEWAY_SERVICES_URL}},$APIGATEWAY_SERVICES_URL,g" $FILE
    sed -i  "s,{{APISTORE_URL}},$APISTORE_URL,g" $FILE
    sed -i  "s,{{APIPUBLISHER_URL}},$APIPUBLISHER_URL,g" $FILE
    sed -i  "s,{{APISTORE_HOSTNAME}},$APISTORE_HOSTNAME,g" $FILE
    sed -i "s,{{REVERSE_PROXY_ENABLED}},$REVERSE_PROXY_ENABLED,g" $FILE
    sed -i "s,{{APISTORE_CONTEXT}},$APISTORE_CONTEXT,g" $FILE
    sed -i "s,{{CARBON_OFFSET}},$CARBON_OFFSET,g" $FILE
    sed -i "s,{{APIPUBLISHER_CONTEXT}},$APIPUBLISHER_CONTEXT,g" $FILE
    sed -i "s,{{APIADMIN_CONTEXT}},$APIADMIN_CONTEXT,g" $FILE
    sed -i "s,{{APIADMIN_URL}},$APIADMIN_URL,g" $FILE
    sed -i "s,{{RECEIVER_URL_GROUP}},$RECEIVER_URL_GROUP,g" $FILE
    sed -i "s,{{AUTH_URL_GROUP}},$AUTH_URL_GROUP,g" $FILE
    sed -i "s,{{TRAFFIC_MANAGER}},$TRAFFIC_MANAGER,g" $FILE
    sed -i "s,{{AM_ANALYTICS_ENABLED}},$AM_ANALYTICS_ENABLED,g" $FILE
    sed -i "s,{{AM_ANALYTICS_API_URL}},$AM_ANALYTICS_API_URL,g" $FILE
    sed -i "s,{{AM_ANALYTICS_SERVER_URL}},$AM_ANALYTICS_SERVER_URL,g" $FILE
    sed -i "s,{{APIM_ANALYTICS_CARBON_OFFSET}},$APIM_ANALYTICS_CARBON_OFFSET,g" $FILE
    sed -i "s,{{WSO2AM_ANALYTICS_DATA_DB_JDBC_URL}},$WSO2AM_ANALYTICS_DATA_DB_JDBC_URL,g" $FILE
    sed -i "s,{{WSO2AM_ANALYTICS_DATA_DB_USERNAME}},$WSO2AM_ANALYTICS_DATA_DB_USERNAME,g" $FILE
    sed -i "s,{{WSO2AM_ANALYTICS_DATA_DB_PASSWORD}},$WSO2AM_ANALYTICS_DATA_DB_PASSWORD,g" $FILE
    sed -i "s,{{WSO2AM_ANALYTICS_DATA_DB_JDBC_DRIVER_CLASS_NAME}},$WSO2AM_ANALYTICS_DATA_DB_JDBC_DRIVER_CLASS_NAME,g" $FILE
    sed -i "s,{{WSO2AM_ANALYTICS_EVENT_DB_JDBC_URL}},$WSO2AM_ANALYTICS_EVENT_DB_JDBC_URL,g" $FILE
    sed -i "s,{{WSO2AM_ANALYTICS_EVENT_DB_USERNAME}},$WSO2AM_ANALYTICS_EVENT_DB_USERNAME,g" $FILE
    sed -i "s,{{WSO2AM_ANALYTICS_EVENT_DB_PASSWORD}},$WSO2AM_ANALYTICS_EVENT_DB_PASSWORD,g" $FILE
    sed -i "s,{{WSO2AM_ANALYTICS_EVENT_DB_JDBC_DRIVER_CLASS_NAME}},$WSO2AM_ANALYTICS_EVENT_DB_JDBC_DRIVER_CLASS_NAME,g" $FILE
    sed -i "s,{{SSL_HOSTNAME_VERIFIER}},$SSL_HOSTNAME_VERIFIER,g" $FILE
    sed -i "s,{{REGISTRY_IDEXING_FREQUENCY_IN_SECONDS}},$REGISTRY_IDEXING_FREQUENCY_IN_SECONDS,g" $FILE
    sed -i "s,{{REGISTRY_INDEXING_BATCH_SIZE}},$REGISTRY_INDEXING_BATCH_SIZE,g" $FILE
    sed -i "s,{{REGISTRY_INDEXER_POOL_SIZE}},$REGISTRY_INDEXER_POOL_SIZE,g" $FILE
    sed -i "s,{{WSO2IS_STAT_DB_JDBC_URL}},$WSO2IS_STAT_DB_JDBC_URL,g" $FILE
    sed -i "s,{{WSO2IS_STAT_DB_USERNAME}},$WSO2IS_STAT_DB_USERNAME,g" $FILE
    sed -i "s,{{WSO2IS_STAT_DB_PASSWORD}},$WSO2IS_STAT_DB_PASSWORD,g" $FILE
    sed -i "s,{{WSO2IS_STAT_DB_JDBC_DRIVER_CLASS_NAME}},$WSO2IS_STAT_DB_JDBC_DRIVER_CLASS_NAME,g" $FILE
    sed -i "s,{{WSO2IS_ANALYTICS_DATA_DB_JDBC_URL}},$WSO2IS_ANALYTICS_DATA_DB_JDBC_URL,g" $FILE
    sed -i "s,{{WSO2IS_ANALYTICS_DATA_DB_USERNAME}},$WSO2IS_ANALYTICS_DATA_DB_USERNAME,g" $FILE
    sed -i "s,{{WSO2IS_ANALYTICS_DATA_DB_PASSWORD}},$WSO2IS_ANALYTICS_DATA_DB_PASSWORD,g" $FILE
    sed -i "s,{{WSO2IS_ANALYTICS_DATA_DB_JDBC_DRIVER_CLASS_NAME}},$WSO2IS_ANALYTICS_DATA_DB_JDBC_DRIVER_CLASS_NAME,g" $FILE
    sed -i "s,{{WSO2IS_ANALYTICS_EVENT_DB_JDBC_URL}},$WSO2IS_ANALYTICS_EVENT_DB_JDBC_URL,g" $FILE
    sed -i "s,{{WSO2IS_ANALYTICS_EVENT_DB_USERNAME}},$WSO2IS_ANALYTICS_EVENT_DB_USERNAME,g" $FILE
    sed -i "s,{{WSO2IS_ANALYTICS_EVENT_DB_PASSWORD}},$WSO2IS_ANALYTICS_EVENT_DB_PASSWORD,g" $FILE
    sed -i "s,{{WSO2IS_ANALYTICS_EVENT_DB_JDBC_DRIVER_CLASS_NAME}},$WSO2IS_ANALYTICS_EVENT_DB_JDBC_DRIVER_CLASS_NAME,g" $FILE
done
}

function getCarbonHomeByProduct() {
    if [ "$1" -eq "is-analytics" ]; then
        echo "/opt/wso2/wso2is-analytics";
    fi
    if [ "$1" -eq "am-analytics" ]; then
        echo "/opt/wso2/wso2am-analytics";
    fi
    if [ "$1" -eq "apim" ]; then
        echo "/opt/wso2/wso2apim";
    fi
    if [ "$1" -eq "is-as-km" ]; then
        echo "/opt/wso2/wso2is";
    fi
    if [ "$1" -eq "is" ]; then
        echo "/opt/wso2/wso2is";
    fi
}