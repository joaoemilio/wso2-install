CARBON_HOME="/opt/wso2/wso2apim"
APIM_HOME="/opt/wso2/wso2am-2.1.0"
PRODUCT="apim"
VERSION="2.1.0"
RESOURCES_PATH="/tmp/resources.tar.gz"
RESOURCES_HOME="/opt/wso2/resources"
_DATAHORA=`date +"%y%m%d_%H%M%S"`
# Essa variável contém o binário (.zip) que vai ser utilizado na instalação
WSO2AM_INSTALL_PATH="/home/wso2/.wum-wso2/products/wso2am/2.1.0/wso2am-2.1.0.1525770697247.zip"

DB_MAX_ACTIVE=50
DB_MIN_ACTIVE=5
DB_MAX_IDLE=5

CARBON_HOST="app1ssosite014h.hom.sicredi.net"
CARBON_MGT_HOSTNAME="app1ssosite014h.hom.sicredi.net"

CARBON_DB_JDBC_URL="jdbc:oracle:thin:@//dtb1admindb040h.hom.sicredi.net:1521/WSO2PDB.hom.sicredi.net"
CARBON_DB_USERNAME="wso2"
CARBON_DB_PASSWORD="wso2123"
CARBON_DB_JDBC_DRIVER_CLASS_NAME="oracle.jdbc.driver.OracleDriver"

WSO2UM_DB_JDBC_URL="jdbc:oracle:thin:@//dtb1admindb040h.hom.sicredi.net:1521/WSO2PDB.hom.sicredi.net"
WSO2UM_DB_USERNAME="wso2"
WSO2UM_DB_PASSWORD="wso2123"
WSO2UM_DB_JDBC_DRIVER_CLASS_NAME="oracle.jdbc.driver.OracleDriver"

WSO2GOV_DB_JDBC_URL="jdbc:oracle:thin:@//dtb1admindb040h.hom.sicredi.net:1521/WSO2PDB.hom.sicredi.net"
WSO2GOV_DB_USERNAME="wso2"
WSO2GOV_DB_PASSWORD="wso2123"
WSO2GOV_DB_JDBC_DRIVER_CLASS_NAME="oracle.jdbc.driver.OracleDriver"

WSO2AM_DB_JDBC_URL="jdbc:oracle:thin:@//dtb1admindb040h.hom.sicredi.net:1521/WSO2PDB.hom.sicredi.net"
WSO2AM_DB_USERNAME="wso2"
WSO2AM_DB_PASSWORD="wso2123"
WSO2AM_DB_JDBC_DRIVER_CLASS_NAME="oracle.jdbc.driver.OracleDriver"

WSO2AM_STAT_DB_JDBC_URL="jdbc:oracle:thin:@//dtb1admindb040h.hom.sicredi.net:1521/WSO2PDB.hom.sicredi.net"
WSO2AM_STAT_DB_USERNAME="wso2_stat"
WSO2AM_STAT_DB_PASSWORD="wso2carbon"
WSO2AM_STAT_DB_JDBC_DRIVER_CLASS_NAME="oracle.jdbc.driver.OracleDriver"

# MB_STORE ORACLE
WSO2_MB_STORE_DB_JDBC_URL="jdbc:oracle:thin:@//dtb1admindb040h.hom.sicredi.net:1521/WSO2PDB.hom.sicredi.net"
WSO2_MB_STORE_DB_USERNAME="wso2"
WSO2_MB_STORE_DB_PASSWORD="wso2123"
WSO2_MB_STORE_DB_JDBC_DRIVER_CLASS_NAME="oracle.jdbc.driver.OracleDriver"

#MB_STORE H2 
#WSO2_MB_STORE_DB_JDBC_URL="jdbc:h2:repository/database/WSO2CARBON_DB;DB_CLOSE_ON_EXIT=FALSE"
#WSO2_MB_STORE_DB_USERNAME="wso2carbon"
#WSO2_MB_STORE_DB_PASSWORD="wso2carbon"
#WSO2_MB_STORE_DB_JDBC_DRIVER_CLASS_NAME="org.h2.Driver"

# METRICS ORACLE
WSO2_METRICS_DB_JDBC_URL="jdbc:oracle:thin:@//dtb1admindb040h.hom.sicredi.net:1521/WSO2PDB.hom.sicredi.net"
WSO2_METRICS_DB_USERNAME="wso2"
WSO2_METRICS_DB_PASSWORD="wso2123"
WSO2_METRICS_DB_JDBC_DRIVER_CLASS_NAME="oracle.jdbc.driver.OracleDriver"

# METRICS H2
#WSO2_METRICS_DB_JDBC_URL="jdbc:h2:repository/database/WSO2METRICS_DB;DB_CLOSE_ON_EXIT=FALSE;AUTO_SERVER=TRUE"
#WSO2_METRICS_DB_USERNAME="wso2carbon"
#WSO2_METRICS_DB_PASSWORD="wso2carbon"
#WSO2_METRICS_DB_JDBC_DRIVER_CLASS_NAME="org.h2.Driver"

WSO2AM_HOSTNAME="app1ssosite014h.hom.sicredi.net"

APISTORE_URL="app1ssosite014h.hom.sicredi.net"
APIPUBLISHER_URL="app1ssosite014h.hom.sicredi.net"

APISTORE_HOSTNAME="app1ssosite014h.hom.sicredi.net"
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
sed -i  "s,{{APISTORE_HOSTNAME}},$APISTORE_HOSTNAME,g" $FILE
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
cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/datasources/master-datasources.xml $CARBON_HOME/repository/conf/datasources/
cp $RESOURCES_HOME/$PRODUCT/$VERSION/conf/datasources/metrics-datasources.xml $CARBON_HOME/repository/conf/datasources/
cp $RESOURCES_HOME/$PRODUCT/$VERSION/store/conf/site.json $CARBON_HOME/repository/deployment/server/jaggeryapps/store/site/conf/
cp $RESOURCES_HOME/oracle12c/ojdbc8.jar $CARBON_HOME/repository/components/lib/
cp $RESOURCES_HOME/wso2carbon.jks $CARBON_HOME/repository/resources/security/$IS_AS_KM_HOSTNAME.wso2carbon.jks 
keytool -export -alias wso2carbon -keystore $CARBON_HOME/repository/resources/security/$IS_AS_KM_HOSTNAME.wso2carbon.jks -file $IS_AS_KM_HOSTNAME.cer
keytool -import -alias $IS_AS_KM_HOSTNAME.wso2carbon -keystore $CARBON_HOME/repository/resources/security/client-truststore.jks -file $IS_AS_KM_HOSTNAME.cer

#keytool -genkey -alias wso2carbon -keyalg RSA -keysize 2048 -keystore wso2carbon.jks -dname "CN=app1ssosite015h.hom.sicredi.net, OU=CAS,O=Sicredi,L=BR,S=BR,C=RS" -storepass wso2carbon -keypass wso2carbon 
