FROM php:7.2-fpm

COPY ./docker/source/php/dev/config/php.ini /usr/local/etc/php/

RUN apt-get update && apt-get install -y --no-install-recommends \
        tar \
        wget \
        procps \
        git \
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
   zip \

COPY ./docker/source/ssh /root/.ssh

RUN chmod 700 /root/.ssh
RUN chmod 644 /root/.ssh/id_rsa.pub
RUN chmod 600 /root/.ssh/id_rsa

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./docker/source/php/prod/script/docker-php-sendmail-entrypoint.sh /usr/local/bin/

RUN chmod 777 /usr/local/bin/docker-php-sendmail-entrypoint.sh

WORKDIR /app