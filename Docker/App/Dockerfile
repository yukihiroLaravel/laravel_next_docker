FROM php:8.3-apache

# Composer は CI（backend の .github/workflows/ci.yml）と同じ版に固定する
COPY --from=composer:2.8.8 /usr/bin/composer /usr/bin/composer

RUN apt-get update \
&& apt-get install -y --no-install-recommends \
git \
zip \
unzip \
vim \
libicu-dev \
libpng-dev \
libjpeg62-turbo-dev \
&& docker-php-ext-install pdo_mysql intl \
&& docker-php-ext-configure gd --with-jpeg \
&& docker-php-ext-install -j$(nproc) gd \
&& rm -rf /var/lib/apt/lists/*

RUN pecl install xdebug-3.5.1 && \
docker-php-ext-enable xdebug

RUN a2enmod rewrite

COPY php.ini /usr/local/etc/php/
COPY 000-default.conf /etc/apache2/sites-enabled/
