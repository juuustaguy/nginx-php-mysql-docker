FROM php:7.1-fpm

COPY ./docker/source/php/prod/config/php.ini /usr/local/etc/php/

RUN apt-get update && apt-get install -y --no-install-recommends \
        g++ \
        git \
        curl \
        apt-utils \
        libcurl4-openssl-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libxml2-dev \
        libicu-dev \
        ssh \
        sendmail \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) \
        gd \
        iconv \
        mcrypt \
        fileinfo \
        json \
        mbstring \
        mysqli \
        opcache \
        pdo \
        pdo_mysql \
        zip \
        soap \
        intl \
        dom \
        xml \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY ./docker/source/ssh /root/.ssh

RUN chmod 700 /root/.ssh
RUN chmod 644 /root/.ssh/id_rsa.pub
RUN chmod 600 /root/.ssh/id_rsa

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update && apt-get install -y --no-install-recommends \
        nodejs \
        build-essential \
    && npm install -g less

COPY ./docker/source/php/prod/script/docker-php-sendmail-entrypoint.sh /usr/local/bin/

RUN chmod 777 /usr/local/bin/docker-php-sendmail-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["docker-php-sendmail-entrypoint.sh"]

CMD ["php-fpm"]