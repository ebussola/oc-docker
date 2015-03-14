#!/bin/bash
cd "`dirname "$0"`"
source _variables.sh

docker stop ${octoberProjectName}-data
docker stop ${octoberProjectName}-web
docker stop ${octoberProjectName}-mysql

docker rm ${octoberProjectName}-data
docker rm ${octoberProjectName}-web
docker rm ${octoberProjectName}-mysql
