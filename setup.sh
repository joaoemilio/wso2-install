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

sh ./resources/setup-apim-$VERSION-$DB.sh
