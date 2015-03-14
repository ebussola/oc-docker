#!/bin/bash
cd "`dirname "$0"`"
source _variables.sh

docker run -it --volumes-from ${octoberProjectName}-data \
    -w /var/www \
    -e APP_ENV=dev \
    --link ${octoberProjectName}-mysql:${octoberProjectName}-mysql "$@"