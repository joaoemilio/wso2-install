CARBON_HOME="/opt/wso2/wso2analytics"
APIM_HOME="/opt/wso2/wso2am-analytics-2.2.0"
PRODUCT="apim-analytics"
VERSION="2.2.0"
RESOURCES_HOME="/tmp/resources"
_DATAHORA=`date +"%y%m%d_%H%M%S"`
# Essa variável contém o binário (.zip) que vai ser utilizado na instalação
LATEST=`ls -ltr ~/.wum3/products/wso2am-analytics/2.2.0/full/ | tail -n1 | awk '{print $NF}'`
WSO2AM_INSTALL_PATH="/home/wso2/.wum3/products/wso2am-analytics/2.2.0/full/$LATEST"
echo "$WSO2AM_INSTALL_PATH"
WSO2_INSTALL_PATH="/opt/wso2/install/wso2-install"