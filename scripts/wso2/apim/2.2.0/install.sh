#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function install() {
    echo "configurando variaveis de ambiente padrão para o wso2 api manager 2.2.0"
    $DIR/env-vars.sh

    echo "configurando variaveis de ambiente do cliente"
    source $1
}
