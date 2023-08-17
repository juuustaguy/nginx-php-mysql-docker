FROM php:8.0-fpm

COPY ./docker/source/php/dev/config/php.ini /usr/local/etc/php/

RUN apt-get update  && apt-get install -y --no-install-recommends \
        libzip-dev \
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
        libpq-dev
RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/
RUN docker-php-ext-install -j$(nproc) \
   pcntl \
   gd \
   intl \
   pdo \
   pdo_mysql \
   pdo_pgsql \
   pgsql \
   iconv \
   fileinfo \
   opcache \
   mysqli \
   xsl \
   gettext \
   xml \
   exif \
   soap \
   zip

COPY ./docker/source/ssh /root/.ssh

RUN chmod 700 /root/.ssh
RUN chmod 600 /root/.ssh/*
RUN find /root/.ssh/. -name "*.pub" -exec chmod 644 {} \;

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.5.4

WORKDIR /app
