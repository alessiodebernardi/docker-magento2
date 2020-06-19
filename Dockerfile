FROM php:7.2-apache

# install basic package
RUN apt-get update \
    && apt-get install -y \
    zip unzip \
    libpng-dev libjpeg-dev \
    zlib1g-dev libicu-dev g++ \
    libxslt-dev \
    libxml2-dev \
    libfreetype6-dev \
    && apt-get clean

# install additional php extensions
RUN docker-php-ext-configure intl
RUN docker-php-ext-configure gd \
    --with-gd \
    --with-jpeg-dir \
    --with-png-dir \
    --with-freetype-dir
RUN docker-php-ext-install pdo pdo_mysql bcmath gd intl soap xsl zip sockets
RUN a2enmod rewrite

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

# Copy file inside image
ARG VHOST_FILE
ADD .docker/$VHOST_FILE /etc/apache2/sites-enabled/000-default.conf
ADD .docker/php.ini /usr/local/etc/php/php.ini
ADD web /var/www/html
WORKDIR /var/www/html/
RUN chmod -R 0777 var/ pub/ generated/ app/
