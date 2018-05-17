CARBON_HOME="/opt/wso2/wso2apim"
APIM_HOME="/opt/wso2/wso2am-2.1.0"
PRODUCT="apim"
VERSION="2.1.0"
RESOURCES_PATH="/tmp/resources.tar.gz"
RESOURCES_HOME="/tmp/resources"
_DATAHORA=`date +"%y%m%d_%H%M%S"`
# Essa variável contém o binário (.zip) que vai ser utilizado na instalação
WSO2AM_INSTALL_PATH="/home/wso2/.wum-wso2/products/wso2am/2.1.0/wso2am-2.1.0.1526286245625.zip"
DB="mysql"
DB_MAX_ACTIVE=20
DB_MIN_ACTIVE=5
DB_MAX_IDLE=5
JDBC_HOST_PORT="10.158.0.5:3307"

JDBC_DRIVER_CLASS_NAME="com.mysql.jdbc.Driver"

CARBON_HOST="apim.minegames.com.br"
CARBON_MGT_HOSTNAME="apim.minegames.com.br"

CARBON_DB_JDBC_URL="jdbc:mysql://$JDBC_HOST_PORT/wso2?useSSL=false"
CARBON_DB_USERNAME="wso2"
CARBON_DB_PASSWORD="wso2123"
CARBON_DB_JDBC_DRIVER_CLASS_NAME=$JDBC_DRIVER_CLASS_NAME

WSO2UM_DB_JDBC_URL="jdbc:mysql://$JDBC_HOST_PORT/wso2?useSSL=false"
WSO2UM_DB_USERNAME="wso2"
WSO2UM_DB_PASSWORD="wso2123"
WSO2UM_DB_JDBC_DRIVER_CLASS_NAME=$JDBC_DRIVER_CLASS_NAME

WSO2GOV_DB_JDBC_URL="jdbc:mysql://$JDBC_HOST_PORT/wso2?useSSL=false"
WSO2GOV_DB_USERNAME="wso2"
WSO2GOV_DB_PASSWORD="wso2123"
WSO2GOV_DB_JDBC_DRIVER_CLASS_NAME=$JDBC_DRIVER_CLASS_NAME

WSO2AM_DB_JDBC_URL="jdbc:mysql://$JDBC_HOST_PORT/wso2?useSSL=false"
WSO2AM_DB_USERNAME="wso2"
WSO2AM_DB_PASSWORD="wso2123"
WSO2AM_DB_JDBC_DRIVER_CLASS_NAME=$JDBC_DRIVER_CLASS_NAME

WSO2AM_STAT_DB_JDBC_URL="jdbc:mysql://$JDBC_HOST_PORT/wso2stat?useSSL=false"
WSO2AM_STAT_DB_USERNAME="wso2stat"
WSO2AM_STAT_DB_PASSWORD="wso2123"
WSO2AM_STAT_DB_JDBC_DRIVER_CLASS_NAME=$JDBC_DRIVER_CLASS_NAME

# MB_STORE ORACLE
WSO2_MB_STORE_DB_JDBC_URL="jdbc:mysql://$JDBC_HOST_PORT/wso2?useSSL=false"
WSO2_MB_STORE_DB_USERNAME="wso2"
WSO2_MB_STORE_DB_PASSWORD="wso2123"
WSO2_MB_STORE_DB_JDBC_DRIVER_CLASS_NAME=$JDBC_DRIVER_CLASS_NAME

#MB_STORE H2 
#WSO2_MB_STORE_DB_JDBC_URL="jdbc:h2:repository/database/WSO2CARBON_DB;DB_CLOSE_ON_EXIT=FALSE"
#WSO2_MB_STORE_DB_USERNAME="wso2carbon"
#WSO2_MB_STORE_DB_PASSWORD="wso2carbon"
#WSO2_MB_STORE_DB_JDBC_DRIVER_CLASS_NAME="org.h2.Driver"

# METRICS ORACLE
WSO2_METRICS_DB_JDBC_URL="jdbc:mysql://$JDBC_HOST_PORT/wso2?useSSL=false"
WSO2_METRICS_DB_USERNAME="wso2"
WSO2_METRICS_DB_PASSWORD="wso2123"
WSO2_METRICS_DB_JDBC_DRIVER_CLASS_NAME=$JDBC_DRIVER_CLASS_NAME

# METRICS H2
#WSO2_METRICS_DB_JDBC_URL="jdbc:h2:repository/database/WSO2METRICS_DB;DB_CLOSE_ON_EXIT=FALSE;AUTO_SERVER=TRUE"
#WSO2_METRICS_DB_USERNAME="wso2carbon"
#WSO2_METRICS_DB_PASSWORD="wso2carbon"
#WSO2_METRICS_DB_JDBC_DRIVER_CLASS_NAME="org.h2.Driver"

WSO2AM_HOSTNAME="apim.minegames.com.br"
APIM_SSL_CERTIFICATE="apim.minegames.com.br.cer"
APIM_SSL_KEY="apim.minegames.com.br.key"
GATEWAY_SSL_CERTIFICATE="gateway.minegames.com.br.cer"
GATEWAY_SSL_KEY="gateway.minegames.com.br.key"
APIM_IP_ADDRESS="10.158.0.2"
GATEWAY_IP_ADDRESS="10.158.0.2"

APISTORE_URL="apim.minegames.com.br"
APIPUBLISHER_URL="apim.minegames.com.br"
REVERSE_PROXY_ENABLED="true"
APISTORE_CONTEXT="/store"
APIADMIN_URL="apim.minegames.com.br"
APIADMIN_CONTEXT="/admin"
APIPUBLISHER_CONTEXT="/publisher"

APISTORE_HOSTNAME="apim.minegames.com.br"
APIGATEWAY_URL="https://gateway.minegames.com.br"

WSO2AM_ANALYTICS_HOSTNAME="analytics-apim.minegames.com.br"
WSO2AM_ANALYTICS_PORT="443"

WSO2IS_ANALYTICS_HOSTNAME="analytics-is.minegames.com.br"
WSO2IS_ANALYTICS_PORT="443"

IS_AS_KM_HOSTNAME="identity.minegames.com.br"
IS_AS_KM_PORT="443"

#echo "descompactando arquivo com configuracoes template"
#tar -xvzf $RESOURCES_PATH

find ./apim -type f | while read FILE
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
sed -i  "s,{{WSO2IS_ANALYTICS_HOSTNAME}},$WSO2IS_ANALYTICS_HOSTNAME,g" $FILE
sed -i  "s,{{WSO2IS_ANALYTICS_PORT}},$WSO2IS_ANALYTICS_PORT,g" $FILE
sed -i  "s,{{WSO2AM_ANALYTICS_HOSTNAME}},$WSO2AM_ANALYTICS_HOSTNAME,g" $FILE
sed -i  "s,{{WSO2AM_ANALYTICS_PORT}},$WSO2AM_ANALYTICS_PORT,g" $FILE
sed -i  "s,{{WSO2AM_HOSTNAME}},$WSO2AM_HOSTNAME,g" $FILE
sed -i  "s,{{APIGATEWAY_URL}},$APIGATEWAY_URL,g" $FILE
sed -i  "s,{{APISTORE_URL}},$APISTORE_URL,g" $FILE
sed -i  "s,{{APIPUBLISHER_URL}},$APIPUBLISHER_URL,g" $FILE
sed -i  "s,{{APISTORE_HOSTNAME}},$APISTORE_HOSTNAME,g" $FILE
sed -i "s,{{REVERSE_PROXY_ENABLED}},$REVERSE_PROXY_ENABLED,g" $FILE
sed -i "s,{{APISTORE_CONTEXT}},$APISTORE_CONTEXT,g" $FILE
done

echo "# removendo instalação anterior"
mv $APIM_HOME $CARBON_HOME.$_DATAHORA

echo "# descompactando binario de instalacao"
cd /opt/wso2/
unzip $WSO2AM_INSTALL_PATH

echo "# API MANAGER #"
echo "backup dos arquivos de configuracao original"
echo $_DATAHORA >> executions.txt 
echo "\n" >> executions.txt 
cp $CARBON_HOME/repository/conf/carbon.xml $CARBON_HOME/repository/conf/carbon.xml.orig.$_DATAHORA
cp $CARBON_HOME/repository/conf/registry.xml $CARBON_HOME/repository/conf/registry.xml.orig.$_DATAHORA
cp $CARBON_HOME/repository/conf/api-manager.xml $CARBON_HOME/repository/conf/api-manager.xml.orig.$_DATAHORA
cp $CARBON_HOME/repository/conf/user-mgt.xml $CARBON_HOME/repository/conf/user-mgt.xml.orig.$_DATAHORA
cp $CARBON_HOME/repository/conf/datasources/master-datasources.xml $CARBON_HOME/repository/conf/datasources/master-datasources.xml.orig.$_DATAHORA
cp $CARBON_HOME/repository/conf/datasources/metrics-datasources.xml $CARBON_HOME/repository/conf/datasources/metrics-datasources.xml.orig.$_DATAHORA
cp $CARBON_HOME/repository/deployment/server/jaggeryapps/store/site/conf/site.json $CARBON_HOME/repository/deployment/server/jaggeryapps/store/site/conf/site.json.orig.$_DATAHORA

echo "# substituindo arquivos de configuracao"
cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/carbon.xml $CARBON_HOME/repository/conf/
cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/registry.xml $CARBON_HOME/repository/conf/
cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/api-manager.xml $CARBON_HOME/repository/conf/
cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/user-mgt.xml $CARBON_HOME/repository/conf/
cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/datasources/master-datasources-$DB.xml $CARBON_HOME/repository/conf/datasources/master-datasources.xml
cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/datasources/metrics-datasources.xml $CARBON_HOME/repository/conf/datasources/
cp $RESOURCES_HOME/$PRODUCT/$VERSION/store/conf/site.json $CARBON_HOME/repository/deployment/server/jaggeryapps/store/site/conf/
cp $RESOURCES_HOME/mysql/mysql-connector-java-5.1.46.jar $CARBON_HOME/repository/components/lib/

echo "atualizando scripts mysql-5.7"
mv $CARBON_HOME/dbscripts/mysql.sql $CARBON_HOME/dbscripts/mysql5.x.sql
mv $CARBON_HOME/dbscripts/mysql5.7.sql $CARBON_HOME/dbscripts/mysql.sql
mv $CARBON_HOME/dbscripts/apimgt/mysql.sql $CARBON_HOME/dbscripts/apimgt/mysql5.x.sql
mv $CARBON_HOME/dbscripts/apimgt/mysql5.7.sql $CARBON_HOME/dbscripts/apimgt/mysql.sql

#cp $RESOURCES_HOME/wso2carbon.jks $CARBON_HOME/repository/resources/security/$IS_AS_KM_HOSTNAME.wso2carbon.jks 
#keytool -export -alias wso2carbon -keystore $CARBON_HOME/repository/resources/security/$IS_AS_KM_HOSTNAME.wso2carbon.jks -file $IS_AS_KM_HOSTNAME.cer
#keytool -import -alias $IS_AS_KM_HOSTNAME.wso2carbon -keystore $CARBON_HOME/repository/resources/security/client-truststore.jks -file $IS_AS_KM_HOSTNAME.cer

#keytool -genkey -alias wso2carbon -keyalg RSA -keysize 2048 -keystore wso2carbon.jks -dname "CN=$IS_AS_KM_HOSTNAME, OU=$SSL_OU,O=$SSL_O,L=$SSL_L,S=$SSL_S,C=$SSL_C" -storepass wso2carbon -keypass wso2carbon 
