FROM debian:8.8

ENV PERCONA_VERSION 5.7

RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN apt-get update && apt-get install -y wget ca-certificates

RUN \
    wget https://repo.percona.com/apt/percona-release_0.1-4.jessie_all.deb \
    && dpkg -i percona-release_0.1-4.jessie_all.deb \
    && rm percona-release_0.1-4.jessie_all.deb \
    && echo percona-server-server-$PERCONA_VERSION percona-server-server/root_password password password | debconf-set-selections \
    && echo percona-server-server-$PERCONA_VERSION percona-server-server/root_password_again password password | debconf-set-selections \
    && apt-get update \
    && apt-get install -y percona-server-server-$PERCONA_VERSION

EXPOSE 3306

RUN find /etc/mysql -type f -exec sed -i 's/^(bind-address|log)/#&/g' {} \; \
     && echo '[mysqld]\nskip-host-cache\nskip-name-resolve' > /etc/mysql/conf.d/docker.cnf

COPY mysql-entrypoint.sh /tmp/mysql-entrypoint.sh
RUN chmod +x /tmp/mysql-entrypoint.sh

CMD ["/tmp/mysql-entrypoint.sh"]
