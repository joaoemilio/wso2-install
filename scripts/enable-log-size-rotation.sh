#!/bin/bash

function printHelp() {
    echo "sh enable-log-size-rotation.sh <script com variaveis de ambiente> <apim|is|is-as-km|am-analytics|is-analytics> <2.2.0|5.5.0>"
}

RESROUCES_HOME="/opt/wso2/install/wso2-install/resources/"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# carregar variaveis de ambiente e functions utilitarias
source $1
source $DIR/functions.sh

setCarbonHomeByProduct $2
PRODUCT=$2
VERSION=$3

if [ -z "${PRODUCT}" ]; then
    echo "A variavel PRODUCT não foi configurada corretamente"
    printHelp
    exit
fi

if [ -z "${VERSION}" ]; then
    echo "A variavel PRODUCT não foi configurada corretamente"
    printHelp 
    exit 
fi

if [ -z "${CARBON_HOME}" ]; then
    echo "A variavel CARBON_HOME não foi configurada corretamente"
    printHelp 
    exit 
fi

if [ -z "${LOG_ROTATION_TYPE}" ]; then
    echo "A variavel LOG_ROTATION_TYPE não foi configurada. Utilizando default 'daily'"
    LOG_ROTATION_TYPE="daily"
else
    if [ -z "${CARBON_LOGFILE_MAXFILESIZE}" ]; then
        echo "A variavel CARBON_LOGFILE_MAXFILESIZE não foi configurada corretamente"
        exit
    fi 
    if [ -z "${CARBON_LOGFILE_MAXBACKUPINDEX}" ]; then
        echo "A variavel CARBON_LOGFILE_MAXBACKUPINDEX não foi configurada corretamente"
        exit
    fi 
fi

echo "$PRODUCT instalado em: $CARBON_HOME"
cp -v $CARBON_HOME/repository/conf/log4j.properties  $CARBON_HOME/repository/conf/log4j.properties.orig

FILE=$RESOURCES_HOME/$PRODUCT/$VERSION/conf/log4j-$LOG_ROTATION_TYPE-rotation.properties
echo $FILE
cp -v $FILE $CARBON_HOME/repository/conf/log4j.properties

if [ "$LOG_ROTATION_TYPE" = "size" ]; then
    sed -i "s,{{CARBON_LOGFILE_MAXFILESIZE}},$CARBON_LOGFILE_MAXFILESIZE,g" $FILE
    sed -i "s,{{CARBON_LOGFILE_MAXBACKUPINDEX}},$CARBON_LOGFILE_MAXBACKUPINDEX,g" $FILE
fi