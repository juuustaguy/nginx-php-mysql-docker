FROM php:7.2-fpm

COPY ./docker/source/php/dev/config/php.ini /usr/local/etc/php/

RUN apt-get update && apt-get install -y --no-install-recommends \
        tar \
        zip \
        wget \
        procps \
        git \
        ssh \
        curl \
        apt-utils \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libmemcached-dev \
        libmagickwand-6.q16-dev \
        libxslt-dev \
        libxml2-dev \
        libicu-dev \
        g++ \
        zlib1g-dev \
&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-install -j$(nproc) \
   pcntl \
   gd \
   intl \
   pdo_mysql \
   iconv \
   fileinfo \
   json \
   opcache \
   pdo \
   pdo_mysql \
   mysqli \
   xsl \
   gettext \
   xml \
   gettext \
   exif \
   soap \
   zip

COPY ./docker/source/ssh /root/.ssh

RUN chmod 700 /root/.ssh
RUN chmod 600 /root/.ssh/*
RUN find /root/.ssh/. -name "*.pub" -exec chmod 644 {} \;

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/xdebug.ini
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=1.10.17
RUN composer global require "fxp/composer-asset-plugin:~1.4.6"

WORKDIR /app