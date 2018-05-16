#!/bin/bash

VERSION=""
DB=""

if [ $1 = "2.2.0" ]
then
   VERSION=$1
fi

if [ $2 = "mariadb" ]
then
   DB=$2
fi

cp -av resources /tmp/
cd /tmp
sh ./resources/setup-apim-$VERSION-$DB.sh
