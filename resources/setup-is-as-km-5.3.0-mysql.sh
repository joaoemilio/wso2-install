CARBON_HOME="/opt/wso2/wso2is"
VERSION="5.3.0"
RELEASE="1526303442903"
IS_HOME="/opt/wso2/wso2is-km-$VERSION"
PRODUCT="is-as-km"
RESOURCES_PATH="/tmp/resources.tar.gz"
RESOURCES_HOME="/tmp/resources"
_DATAHORA=`date +"%y%m%d_%H%M%S"`
# Essa variável contém o binário (.zip) que vai ser utilizado na instalação
WSO2IS_AS_KM_INSTALL_PATH="/home/wso2/.wum-wso2/products/wso2is-km/$VERSION/wso2is-km-$VERSION.$RELEASE.zip"
DB="mysql"
DB_DRIVER_FILENAME="mysql-connector-java-5.1.46.jar"
DB_MAX_ACTIVE=20
DB_MIN_ACTIVE=5
DB_MAX_IDLE=5
JDBC_HOST_PORT="10.158.0.5"

JDBC_DRIVER_CLASS_NAME="com.mysql.jdbc.Driver"

CARBON_HOST="identity53.minegames.com.br"
CARBON_MGT_HOSTNAME="identity53.minegames.com.br"
CARBON_OFFSET="100"
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

WSO2AM_HOSTNAME="apim21.minegames.com.br"

APISTORE_URL="apim21.minegames.com.br"
APISTORE_VAR="{{APISTORE_WHITELISTED_HOSTNAMES}}"
APIPUBLISHER_URL="apim21.minegames.com.br"

APISTORE_WHITELISTED_HOSTNAMES='"localhost", "apim21.minegames.com.br","identity53.minegames.com.br"' 
APIGATEWAY_URL="https://gateway21.minegames.com.br"

WSO2AM_ANALYTICS_HOSTNAME="apim-analytics21.minegames.com.br"
WSO2AM_ANALYTICS_PORT="443"

WSO2IS_ANALYTICS_HOSTNAME="is-analytics21.minegames.com.br"
WSO2IS_ANALYTICS_PORT="443"

IS_AS_KM_HOSTNAME="identity53.minegames.com.br"
IS_AS_KM_PORT="443"

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
sed -i "s,{{CARBON_OFFSET}},$CARBON_OFFSET,g" $FILE
#sed -i "s,$APISTORE_VAR,$APISTORE_WHITELISTED_HOSTNAMES,g" $FILE
done

echo "# removendo instalação anterior"
mv $IS_HOME $CARBON_HOME.$_DATAHORA

#tar -xvzf ../files/wum-2.0-linux-x64.tar.gz /opt/wso2/
#wum add wso2is

echo "# descompactando binario de instalacao"
cd /opt/wso2/
unzip $WSO2IS_AS_KM_INSTALL_PATH
ln -s wso2is-km-$VERSION wso2is

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
cp $RESOURCES_HOME/$DB/$DB_DRIVER_FILENAME $CARBON_HOME/repository/components/lib/
cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/tomcat/catalina-server.xml $CARBON_HOME/repository/conf/tomcat/

#cp $RESOURCES_HOME/wso2carbon.jks $CARBON_HOME/repository/resources/security/

#cd $RESOURCES_HOME
#SSL_C="BR"
#SSL_O="Minegames"
#SSL_OU="MineGames Software"
#SSL_L="Rio de Janeiro"
#SSL_ST="RJ"
#keytool -genkey -alias wso2carbon -keyalg RSA -keysize 2048 -keystore wso2carbon.jks -dname "CN=$IS_AS_KM_HOSTNAME, OU=$SSL_OU,O=$SSL_O,L=$SSL_L,ST=$SSL_ST,C=$SSL_C" -storepass wso2carbon -keypass wso2carbon 
#cp $RESOURCES_HOME/wso2carbon.jks $CARBON_HOME/repository/resources/security/
