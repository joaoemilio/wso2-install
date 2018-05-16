#!/bin/bash

VERSION=""
DB=""
PRODUCT=""

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
sh ./resources/setup-$PRODUCT-$VERSION-$DB.sh
