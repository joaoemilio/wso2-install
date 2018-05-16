CARBON_HOME="/opt/wso2/wso2is"
IS_HOME="/opt/wso2/wso2is-km-5.5.0"
PRODUCT="is-as-km"
VERSION="5.5.0"
RESOURCES_PATH="/tmp/resources.tar.gz"
RESOURCES_HOME="/tmp/resources"
_DATAHORA=`date +"%y%m%d_%H%M%S"`
# Essa variável contém o binário (.zip) que vai ser utilizado na instalação
WSO2IS_AS_KM_INSTALL_PATH="/home/wso2/.wum-wso2/products/wso2is-km/5.5.0/wso2is-km-5.5.0.1525356716281.zip"
DB="mysql"
DB_MAX_ACTIVE=20
DB_MIN_ACTIVE=5
DB_MAX_IDLE=5
DB_IP_ADDRESS="10.158.0.5"

JDBC_DRIVER_CLASS_NAME="com.mysql.jdbc.Driver"

CARBON_HOST="app1ssosite014h.hom.sicredi.net"
CARBON_MGT_HOSTNAME="app1ssosite014h.hom.sicredi.net"

CARBON_DB_JDBC_URL="jdbc:mysql://$DB_IP_ADDRESS:3306/wso2?useSSL=false"
CARBON_DB_USERNAME="wso2"
CARBON_DB_PASSWORD="wso2123"
CARBON_DB_JDBC_DRIVER_CLASS_NAME=$JDBC_DRIVER_CLASS_NAME

WSO2UM_DB_JDBC_URL="jdbc:mysql://$DB_IP_ADDRESS:3306/wso2?useSSL=false"
WSO2UM_DB_USERNAME="wso2"
WSO2UM_DB_PASSWORD="wso2123"
WSO2UM_DB_JDBC_DRIVER_CLASS_NAME=$JDBC_DRIVER_CLASS_NAME

WSO2GOV_DB_JDBC_URL="jdbc:mysql://$DB_IP_ADDRESS:3306/wso2?useSSL=false"
WSO2GOV_DB_USERNAME="wso2"
WSO2GOV_DB_PASSWORD="wso2123"
WSO2GOV_DB_JDBC_DRIVER_CLASS_NAME=$JDBC_DRIVER_CLASS_NAME

WSO2AM_DB_JDBC_URL="jdbc:mysql://$DB_IP_ADDRESS:3306/wso2?useSSL=false"
WSO2AM_DB_USERNAME="wso2"
WSO2AM_DB_PASSWORD="wso2123"
WSO2AM_DB_JDBC_DRIVER_CLASS_NAME=$JDBC_DRIVER_CLASS_NAME

WSO2AM_STAT_DB_JDBC_URL="jdbc:mysql://$DB_IP_ADDRESS:3306/wso2stat?useSSL=false"
WSO2AM_STAT_DB_USERNAME="wso2stat"
WSO2AM_STAT_DB_PASSWORD="wso2123"
WSO2AM_STAT_DB_JDBC_DRIVER_CLASS_NAME=$JDBC_DRIVER_CLASS_NAME

# MB_STORE ORACLE
WSO2_MB_STORE_DB_JDBC_URL="jdbc:mysql://$DB_IP_ADDRESS:3306/wso2?useSSL=false"
WSO2_MB_STORE_DB_USERNAME="wso2"
WSO2_MB_STORE_DB_PASSWORD="wso2123"
WSO2_MB_STORE_DB_JDBC_DRIVER_CLASS_NAME=$JDBC_DRIVER_CLASS_NAME

#MB_STORE H2 
#WSO2_MB_STORE_DB_JDBC_URL="jdbc:h2:repository/database/WSO2CARBON_DB;DB_CLOSE_ON_EXIT=FALSE"
#WSO2_MB_STORE_DB_USERNAME="wso2carbon"
#WSO2_MB_STORE_DB_PASSWORD="wso2carbon"
#WSO2_MB_STORE_DB_JDBC_DRIVER_CLASS_NAME="org.h2.Driver"

# METRICS ORACLE
WSO2_METRICS_DB_JDBC_URL="jdbc:mysql://$DB_IP_ADDRESS:3306/wso2?useSSL=false"
WSO2_METRICS_DB_USERNAME="wso2"
WSO2_METRICS_DB_PASSWORD="wso2123"
WSO2_METRICS_DB_JDBC_DRIVER_CLASS_NAME=$JDBC_DRIVER_CLASS_NAME

# METRICS H2
#WSO2_METRICS_DB_JDBC_URL="jdbc:h2:repository/database/WSO2METRICS_DB;DB_CLOSE_ON_EXIT=FALSE;AUTO_SERVER=TRUE"
#WSO2_METRICS_DB_USERNAME="wso2carbon"
#WSO2_METRICS_DB_PASSWORD="wso2carbon"
#WSO2_METRICS_DB_JDBC_DRIVER_CLASS_NAME="org.h2.Driver"

WSO2AM_HOSTNAME="app1ssosite014h.hom.sicredi.net"

APISTORE_URL="app1ssosite014h.hom.sicredi.net"
APISTORE_VAR="{{APISTORE_WHITELISTED_HOSTNAMES}}"
APIPUBLISHER_URL="app1ssosite014h.hom.sicredi.net"

APISTORE_WHITELISTED_HOSTNAMES='"localhost", "app1ssosite014h.hom.sicredi.net"' 
APIGATEWAY_URL="https://app1ssosite014h.hom.sicredi.net:8243"

WSO2AM_ANALYTICS_HOSTNAME="app1ssosite016h.hom.sicredi.net"
WSO2AM_ANALYTICS_PORT="9443"

WSO2IS_ANALYTICS_HOSTNAME="app1ssosite016h.hom.sicredi.net"
WSO2IS_ANALYTICS_PORT="9444"

IS_AS_KM_HOSTNAME="app1ssosite015h.hom.sicredi.net"
IS_AS_KM_PORT="9443"

#echo "descompactando arquivo com configuracoes template"
#tar -xvzf $RESOURCES_PATH

find . -type f -name *.xml | while read FILE
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
#sed -i "s,$APISTORE_VAR,$APISTORE_WHITELISTED_HOSTNAMES,g" $FILE
done

echo "# removendo instalação anterior"
mv $IS_HOME $CARBON_HOME.$_DATAHORA

echo "# descompactando binario de instalacao"
cd /opt/wso2/
ln -s wso2is-km-$VERSION wso2is
unzip $WSO2IS_AS_KM_INSTALL_PATH

echo "# IDENTITY SERVER AS KEY MANAGER #"
echo "backup dos arquivos de configuracao original"
echo $_DATAHORA >> executions.txt 
echo "\n" >> executions.txt 
cp $CARBON_HOME/repository/conf/carbon.xml $CARBON_HOME/repository/conf/carbon.xml.orig.$_DATAHORA
cp $CARBON_HOME/repository/conf/consent-mgt-config.xml $CARBON_HOME/repository/conf/consent-mgt-config.xml.orig.$_DATAHORA
cp $CARBON_HOME/repository/conf/registry.xml $CARBON_HOME/repository/conf/registry.xml.orig.$_DATAHORA
cp $CARBON_HOME/repository/conf/api-manager.xml $CARBON_HOME/repository/conf/api-manager.xml.orig.$_DATAHORA
cp $CARBON_HOME/repository/conf/user-mgt.xml $CARBON_HOME/repository/conf/user-mgt.xml.orig.$_DATAHORA
cp $CARBON_HOME/repository/conf/datasources/master-datasources.xml $CARBON_HOME/repository/conf/datasources/master-datasources.xml.orig.$_DATAHORA
cp $CARBON_HOME/repository/conf/identity/identity.xml $CARBON_HOME/repository/conf/identity/identity.xml.orig.$_DATAHORA
cp $CARBON_HOME/repository/conf/identity/embedded-ldap.xml $CARBON_HOME/repository/conf/identity/embedded-ldap.xml.orig.$_DATAHORA
cp $CARBON_HOME/repository/conf/identity/thrift-authentication.xml $CARBON_HOME/repository/conf/identity/thrift-authentication.xml.orig.$_DATAHORA

echo "# substituindo arquivos de configuracao"
cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/carbon.xml $CARBON_HOME/repository/conf/
cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/consent-mgt-config.xml $CARBON_HOME/repository/conf/
cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/registry.xml $CARBON_HOME/repository/conf/
cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/api-manager.xml $CARBON_HOME/repository/conf/
cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/user-mgt.xml $CARBON_HOME/repository/conf/
cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/datasources/master-datasources.xml $CARBON_HOME/repository/conf/datasources/
cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/identity/identity.xml $CARBON_HOME/repository/conf/identity/
cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/identity/embedded-ldap.xml $CARBON_HOME/repository/conf/identity/
cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/identity/thrift-authentication.xml $CARBON_HOME/repository/conf/identity/
cp $RESOURCES_HOME/oracle12c/ojdbc8.jar $CARBON_HOME/repository/components/lib/
cp $RESOURCES_HOME/wso2carbon.jks $CARBON_HOME/repository/resources/security/
