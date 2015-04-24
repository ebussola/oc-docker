FROM debian:wheezy

RUN apt-get upgrade -y
RUN apt-get update
RUN apt-get install -y wget ca-certificates

RUN wget -qO - http://www.dotdeb.org/dotdeb.gpg | apt-key add -
ADD dotdeb.list /etc/apt/sources.list.d/dotdeb.list

RUN apt-get update
RUN apt-get install -y git php5 php5-dev php-pear php5-mcrypt php5-mysql php5-intl php5-curl php5-gd mysql-client
RUN pecl install xdebug

RUN php -r "readfile('https://getcomposer.org/installer');" | php
RUN mv composer.phar /usr/local/bin/composer

ADD xdebug.ini /etc/php5/mods-available/xdebug.ini
RUN echo "date.timezone = America/Sao_Paulo" > /etc/php5/mods-available/timezone.ini
RUN echo "intl.default_locale = pt_BR" >> /etc/php5/mods-available/intl.ini
RUN php5enmod xdebug && php5enmod timezone

# Install phpunit
RUN wget https://phar.phpunit.de/phpunit.phar && chmod +x phpunit.phar && mv phpunit.phar /usr/local/bin/phpunit

RUN a2enmod php5
RUN a2enmod rewrite
ADD apache-site-default.conf /etc/apache2/sites-available/default

# Added this to fix file permission issue when mounting data volume
# from host machine
RUN usermod -u 1000 www-data
