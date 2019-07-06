#!/bin/bash
umask 002
#########################################################################
# MXSSH 
# Copyright MXSSH    2016
# All Rights Reserved.
# Author:    Fabio Santos B. da SIlva
# Version:   1.0.0
# Date:      01/27/2016
# Purpose:   Jython Script using SSH
#########################################################################
RUN_PATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd) 
#RUN_PATH=$(echo $RUN_PATH | sed -e "s/\/bin//g")

export MX_HOME

echo $MX_HOME

java -server -Xmx512m -Xms128m -Dmxssh.path=$RUN_PATH -cp "$RUN_PATH/lib/*" com.mxssh.JythonScript $*

echo " "
