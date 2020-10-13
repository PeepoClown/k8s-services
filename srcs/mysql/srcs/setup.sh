#!/bin/sh

openrc default
/etc/init.d/mariadb setup
rc-service mariadb start

mysql -u root < /var/mysql_init.sql
mysql wordpress -u root < /var/mysql_wordpress.sql

rc-service mariadb stop

/usr/bin/mysqld_safe --datadir='/var/lib/mysql'
