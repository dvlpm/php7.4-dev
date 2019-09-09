FROM php:7.4.0RC1-fpm-alpine

RUN apk --no-cache add git subversion openssh mercurial tini bash patch zip unzip php-pgsql

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

WORKDIR /var/www/html
