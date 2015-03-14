#!/bin/bash
cd "`dirname "$0"`"
source _variables.sh

if ! docker ps | grep -q ${octoberProjectName}-mysql; then
    docker run -d --name ${octoberProjectName}-mysql dockerfile/mysql
    sleep 2
    ./run.sh mysql -h ${octoberProjectName}-mysql -e "create database ${octoberProjectName}"
fi