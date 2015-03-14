#!/bin/bash
cd "`dirname "$0"`"
source _variables.sh

./_start-mysql.sh

if ! docker ps | grep -q ${octoberProjectName}-web ; then
    ./_base.sh --name ${octoberProjectName}-web -p 80:80 -p 9000:9000 -d ${octoberProjectName} \
    /usr/sbin/apache2ctl -D FOREGROUND
fi
