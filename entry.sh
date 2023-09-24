#!/bin/bash
envsubst '${PORT}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

/usr/sbin/php-fpm -D && nginx -g "daemon off;"
