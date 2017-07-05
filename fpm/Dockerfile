FROM debian:stretch
 
RUN \
        apt-get update && \
        apt-get install -y  wget && \
        apt-get install -y --no-install-recommends php7.0 php7.0-fpm && \
        wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64.deb && \
        dpkg -i dumb-init_*.deb
 
VOLUME ["/var/www/html"]
EXPOSE 9000
 
COPY conf/php.ini /etc/php/7.0/lib/php.ini
COPY conf/www.conf /etc/php/7.0/fpm/pool.d/www.conf
COPY conf/php-fpm.conf /etc/php/7.0/fpm/php-fpm.conf
 
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD /usr/sbin/php-fpm7.0 --nodaemonize

