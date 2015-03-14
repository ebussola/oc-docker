#!/bin/bash
cd "`dirname "$0"`"
source _variables.sh

# Setup Data folder
docker run --name ${octoberProjectName}-data -v $(pwd)/..:/var/www debian:wheezy

# Setup Main Server
docker build -t ${octoberProjectName} .

./_update-dependencies.sh