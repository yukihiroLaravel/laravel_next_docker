FROM php:8.3-apache

ADD php.ini /usr/local/etc/php/
ADD 000-default.conf /etc/apache2/sites-enabled/

RUN cd /usr/bin && curl -s http://getcomposer.org/installer | php && ln -s /usr/bin/composer.phar /usr/bin/composer

RUN apt-get update \
&& apt-get install -y \
git \
zip \
unzip \
vim \
libpng-dev \
libpq-dev \
libjpeg62-turbo-dev \
&& docker-php-ext-install pdo_mysql \
&& docker-php-ext-configure gd --with-jpeg \
&& docker-php-ext-install -j$(nproc) gd

RUN pecl install xdebug && \
docker-php-ext-enable xdebug

RUN mv /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled
RUN /bin/sh -c a2enmod rewrite
