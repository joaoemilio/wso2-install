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

tar -cvzf /tmp/resources.tar.gz resources
cd /tmp
tar -xvzf resources.tar.gz
sh ./resources/setup-apim-$VERSION-$DB.sh
