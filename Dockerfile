FROM php:7.4-fpm

RUN apt-get update \
    && apt-get install -y \
      wget \
      gnupg2 \
      libpq-dev \
      zip \
      unzip \
      sqlite3 \
      libsqlite3-dev \
      m4 \
      libpng-dev \
      libjpeg-dev \
      libmagickwand-dev \
      zlib1g-dev \
      libzip-dev \
      libwebp-dev \
      libjpeg62-turbo-dev \
      libpng-dev libxpm-dev \
      libfreetype6-dev \
      librabbitmq-dev \
      zip \
    && pecl install xdebug-2.9.1 \
    && pecl install protobuf-3.11.4 \
    && pecl install grpc \
    && pecl install amqp-1.9.4 \
    && docker-php-ext-enable xdebug protobuf grpc amqp \
    && docker-php-ext-install pdo_mysql pdo_pgsql bcmath zip gd sockets \
    # Composer
    && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer \
    # Blackfire
    && wget -q -O - https://packages.blackfire.io/gpg.key | apt-key add - \
    && echo "deb http://packages.blackfire.io/debian any main" | tee /etc/apt/sources.list.d/blackfire.list \
    && apt-get update \
    && apt-get install -y \
      blackfire-agent \
      blackfire-php \
    # Fake user id
    && usermod -u 1000 www-data

WORKDIR /var/www/html
