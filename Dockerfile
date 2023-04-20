FROM php:8.1-fpm-alpine

WORKDIR /var/www/html

RUN apk add --no-cache zip libzip-dev supervisor
RUN docker-php-ext-configure zip
RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo pdo_mysql pcntl


RUN chown -R www-data:www-data /var/www

# Create a new user
Run adduser --disabled-password --gecos '' developer

# Add user to the group
RUN chown -R developer:www-data /var/www
RUN chmod -R 755 /var/www

# Switch to this user
USER developer

