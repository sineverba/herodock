#!/usr/bin/env sh
set -e
#sed -i -e 's/80/'"$PORT"'/g' /etc/nginx/conf.d/default.conf
sed -i -e 's/80/'"$PORT"'/g' /etc/nginx/sites-enabled/default
php-fpm -D
nginx -g 'daemon off;'