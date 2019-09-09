FROM php:7.4.0RC1-fpm

RUN apk --no-cache add git subversion openssh mercurial tini bash patch zip unzip php-pgsql
RUN pecl install xdebug-2.7.0beta1 
RUN docker-php-ext-install pdo pdo_mysql pdo_pgsql xdebug

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

WORKDIR /var/www/html
