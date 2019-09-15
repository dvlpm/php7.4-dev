FROM php:7.4.0RC1-fpm

RUN apt-get update \
    && apt-get install -y libpq-dev zip unzip

RUN docker-php-ext-install pdo_mysql pdo_pgsql bcmath

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

WORKDIR /var/www/html
