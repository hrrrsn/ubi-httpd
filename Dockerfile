FROM registry.access.redhat.com/ubi9/ubi:9.2

COPY phpinfo.php /usr/share/nginx/html/phpinfo.php
COPY nginx.conf /etc/nginx/nginx.conf.template
COPY entry.sh /entry.sh

RUN yum upgrade -y; \
    yum install -y rsync nginx procps; \
    yum module install php:8.1/common -y; \
    yum clean all -y; \
    mkdir -p /run/php-fpm/; \
    ln -sf /dev/stdout /var/log/nginx/access.log; \
    ln -sf /dev/stderr /var/log/nginx/error.log; \
    chmod +x /entry.sh

EXPOSE 8080

CMD ["/entry.sh"]