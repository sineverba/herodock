##########################
##       SETUP          ##
##########################
FROM php:8.0.3-cli-alpine3.13 as builder

COPY --from=composer:2.0.9 /usr/bin/composer /usr/bin/composer

RUN mkdir -p /usr/src/app

COPY . /usr/src/app

WORKDIR /usr/src/app

RUN composer install --no-dev

##########################
##       TEST           ##
##########################
FROM php:8.0.3-cli-alpine3.13 as test

RUN mkdir -p /usr/src/app

COPY --from=builder /usr/bin/composer /usr/bin/composer
COPY --from=builder /usr/src/app /usr/src/app

WORKDIR /usr/src/app

RUN composer install

RUN vendor/bin/phpunit

##########################
##       DEPLOY         ##
##########################
FROM php:8.0.3-fpm as deploy

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN docker-php-ext-install opcache && docker-php-ext-enable opcache

COPY docker-build/php-config/10-opcache.ini $PHP_INI_DIR/conf.d/
COPY docker-build/default.conf /etc/nginx/sites-enabled/default
COPY docker-build/entrypoint.sh /etc/entrypoint.sh
RUN chmod +x /etc/entrypoint.sh

# Copy application source
COPY --from=builder /usr/src/app /var/www
RUN chown -R www-data:www-data /var/www

CMD ["/etc/entrypoint.sh"]