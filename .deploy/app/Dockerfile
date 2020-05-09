##########################
##       SETUP          ##
##########################
FROM php:7.4-cli-alpine as builder

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN mkdir -p /usr/src/app

COPY . /usr/src/app

WORKDIR /usr/src/app

RUN composer install --no-dev

##########################
##       TEST           ##
##########################
FROM php:7.4-cli-alpine as test

RUN mkdir -p /usr/src/app

COPY --from=builder /usr/bin/composer /usr/bin/composer
COPY --from=builder /usr/src/app /usr/src/app

WORKDIR /usr/src/app

RUN composer install

RUN vendor/bin/phpunit

##########################
##       DEPLOY         ##
##########################
FROM php:7-apache as deploy

COPY .deploy/apache/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY .deploy/scripts/start-apache /usr/local/bin
RUN a2enmod rewrite

# Copy application source
#COPY app /var/www/
COPY --from=builder /usr/src/app /var/www
RUN chown -R www-data:www-data /var/www

CMD ["start-apache"]