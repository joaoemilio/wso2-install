#!/bin/bash

CARBON_HOME="/opt/wso2/wso2is"
APIM_HOME="/opt/wso2/wso2is-km-5.7.0"
IS_HOME="/opt/wso2/wso2is-km-5.7.0"
PRODUCT="is-as-km"
VERSION="5.7.0"
RESOURCES_HOME="/tmp/resources"
_DATAHORA=`date +"%y%m%d_%H%M%S"`
# Essa variável contém o binário (.zip) que vai ser utilizado na instalação
LATEST=`ls -ltr ~/.wum3/products/wso2is-km/5.7.0/full/ | tail -n1 | awk '{print $NF}'`
WSO2IS_INSTALL_PATH="/home/wso2/.wum3/products/wso2is-km/5.7.0/full/$LATEST"
echo "$WSO2AM_INSTALL_PATH"
WSO2_INSTALL_PATH="/opt/wso2/install/wso2-install"