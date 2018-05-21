#!/bin/bash

VERSION=""
DB=""
PRODUCT=""
ENV_SETUP_SCRIPT=$4

PRODUCT=$1

#if [ $1 = "2.2.0" ]
#then
   VERSION=$2
#fi

#if [ $2 = "mariadb" ]
#then
   DB=$3
#fi

cp -av resources /tmp/
cd /tmp
sh $ENV_SETUP_SCRIPT
sh ./resources/setup-$PRODUCT-$VERSION-$DB.sh

SSL_CN="apim21.minegames.com.br"
SSL_DN=""
#openssl genrsa -des3 -out $SSL_CN.key 1024
#sudo openssl req -new -key $SSL_CN.key -out $SSL_CN.csr
#sudo cp $SSL_CN.key $SSL_CN.key.org
#sudo openssl rsa -in $SSL_CN.key.org -out $SSL_CN.key
#sudo openssl x509 -req -days 365 -in $SSL_CN.csr -signkey $SSL_CN.key -out $SSL_CN.crt
#sudo cp identity* /etc/nginx/ssl/