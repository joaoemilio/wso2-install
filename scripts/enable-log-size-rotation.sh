#!/bin/bash

function printHelp() {
    echo "sh enable-log-size-rotation.sh <script com variaveis de ambiente> <apim|is|is-as-km|am-analytics|is-analytics> <2.2.0|5.5.0>"
}

# chamar o script de variaveis do ambiente do cliente
source $1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/functions.sh 
echo $DIR
sh $DIR/functions.sh 

CARBON_HOME=getCarbonHomeByProduct $2 
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
