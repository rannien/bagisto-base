FROM php:8.4-fpm

ARG HOST_UID
ARG HOST_GID
ARG USERNAME=www-data

# Install core extensions + locales
RUN apt -y update && \
    docker-php-ext-install pdo pdo_mysql calendar && \
    apt install -y locales && \
    sed -Ei 's/# ((hu_HU|en_US|zh_CN).UTF-8 )/\1/' /etc/locale.gen && \
    locale-gen

# Install ext-gd (with WebP support)
RUN apt -y update && \
    apt install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libwebp-dev && \
    docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp && \
    docker-php-ext-install -j$(nproc) gd

# Install ext-intl
RUN apt -y update && \
    apt install -y \
        zlib1g-dev \
        libicu-dev \
        g++ && \
    docker-php-ext-configure intl && \
    docker-php-ext-install intl

# Install ext-zip
RUN apt -y update && \
    apt install -y \
        libzip-dev \
        zip && \
    docker-php-ext-install zip

# Install ext-exif
RUN docker-php-ext-install exif

RUN apt-get update && apt-get install -y \
    libmemcached-dev \
    zlib1g-dev \
    libzip-dev

# Install the PHP Memcached extension
RUN pecl install memcached redis xdebug \
&& docker-php-ext-enable memcached redis xdebug

RUN usermod -u ${HOST_UID} ${USERNAME}
RUN groupmod -g ${HOST_GID} ${USERNAME}
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers

# Install composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

ENV COMPOSER_HOME=/tmp/.composer

# Copy local php settings
COPY php.ini-development /usr/local/etc/php/conf.d/docker-fpm.ini
COPY php-xdebug.ini /usr/local/etc/php/conf.d/

# xdebug
EXPOSE 9005

WORKDIR /webapp

USER ${USERNAME}

# Copy entrypoint
COPY --chmod=777 docker-entrypoint.sh /

ENTRYPOINT /docker-entrypoint.sh
