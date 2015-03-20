# OctoberCMS Docker
Run your OctoberCMS inside a docker container!

This tool was build for development environment only. If you pretend to use it in production you have to modify the
scripts by yourself to your needs.

## Installation
Drop the folder "docker" inside your root October application.

Edit the file _variables.sh to match your needs.
**NOTE for project name** : use only lowercase, no hyphens, no spaces and no special chars

### Configure your database.php file to access your mysql container
 Use these values for your mysql configuration:
 
 * host: env('\<YOUR_UPPERCASE_PROJECT_NAME\>_MYSQL_PORT_3306_TCP_ADDR')
 * database: \<your_project_name\>
 * user: 'root'
 * password: ''
 
 For our example the host will be: env('EXAMPLE_MYSQL_PORT_3306_TCP_ADDR')

### With Boot2Docker
Start boot2docker bash, go to your application root folder then run the following commands:

* docker/build.sh
* docker/serve.sh

Find out what is your docker VM ip address with `boot2docker ip` and open it on the browser.

### Without Boot2Docker

Same with boot2docker except that you don't need to start the VM and you can use localhost to access your application.

## Troubleshoot
If something went wrong and you want to start over, just run `docker/_remove_all.sh` and start again.
