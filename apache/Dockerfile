FROM debian:stretch

VOLUME [ "/var/www/html" ]
EXPOSE 80

RUN apt-get -y update && apt-get install -y apache2 wget
#RUN apt -y install git
RUN wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64.deb && dpkg -i dumb-init_*.deb
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod proxy_fcgi
#RUN git clone https://github.com/letsencrypt/letsencrypt
#RUN /data/letsencrypt/letsencrypt-auto --apache --email your@email.org --agree-tos -d yourwebsite.org

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD /usr/sbin/apache2ctl -D FOREGROUND
