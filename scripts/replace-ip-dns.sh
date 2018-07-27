#! /bin/bash
IP=$1
HOST=$2

cd $3

find . -type f | while read FILE
do
    sed -i "s,$IP,$HOST,g" $FILE
done
