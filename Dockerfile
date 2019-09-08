FROM php:7.4.0RC1-fpm-alpine

RUN apk --no-cache add git subversion openssh mercurial tini bash patch zip unzip

RUN curl --silent --show-error https://getcomposer.org/installer | php

COPY entrypoint.sh /entrypoint.sh

WORKDIR /var/www/html

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

CMD ["composer"]
