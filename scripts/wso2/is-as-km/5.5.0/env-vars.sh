#!/bin/bash

CARBON_HOME="/opt/wso2/wso2is"
APIM_HOME="/opt/wso2/wso2is-km-5.5.0"
IS_HOME="/opt/wso2/wso2is-km-5.5.0"
PRODUCT="is-as-km"
VERSION="5.5.0"
RESOURCES_HOME="/tmp/resources"
_DATAHORA=`date +"%y%m%d_%H%M%S"`
# Essa variável contém o binário (.zip) que vai ser utilizado na instalação
LATEST=`ls -ltr ~/.wum-wso2/products/wso2is-km/5.5.0/ | tail -n1 | awk '{print $NF}'`
WSO2IS_INSTALL_PATH="/home/wso2/.wum-wso2/products/wso2is-km/5.5.0/$LATEST"
echo "$WSO2AM_INSTALL_PATH"
WSO2_INSTALL_PATH="/opt/wso2/install/wso2-install"