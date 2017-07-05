#!/usr/bin/env bash

set -m
set -e

ROOT_PASSWD=/run/secrets/mysql-root-passwd
MYSQL_DB=${DB_NAME:-db}

/etc/init.d/mysql start

mysql -v -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWD}'"
mysql -v -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB}"
mysql -v -u root -e "FLUSH PRIVILEGES"

/etc/init.d/mysql stop

mysqld_safe &

fg
