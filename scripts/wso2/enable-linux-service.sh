#!/bin/bash
if [ "$1" == "" ]; then
    echo "script de servico nao vai considerar profile"
    sudo cp /opt/wso2/install/wso2-install/scripts/linux-service/wso2server /etc/init.d/wso2server 
else
    echo "script de servico vai utilizar o profile: $1" 
    sudo cp /opt/wso2/install/wso2-install/scripts/linux-service/wso2server-$1 /etc/init.d/wso2server 
fi
sudo chkconfig wso2server on 