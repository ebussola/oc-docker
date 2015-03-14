#!/bin/bash
cd "`dirname "$0"`"
source _variables.sh

# Start Mysql and install all the dependencies
./_start-mysql.sh
./run.sh composer install --no-dev --optimize-autoloader --no-interaction

# Libraries that uses composer
for pluginPath in "${pluginPaths[@]}"
do
	./run.sh composer install --working-dir=/var/www/${pluginPath} --no-interaction
done

# setup/update october
./run.sh php artisan october:up