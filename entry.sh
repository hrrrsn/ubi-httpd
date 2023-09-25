#!/bin/bash
: "${PORT:=8080}"
: "${DOCUMENT_ROOT:=/usr/share/nginx/html}"

envsubst '${PORT},${DOCUMENT_ROOT}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

/usr/sbin/php-fpm -D && nginx -g "daemon off;"