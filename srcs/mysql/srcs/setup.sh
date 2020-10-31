#!/bin/sh

rc default
/etc/init.d/mariadb setup
/etc/init.d/mariadb start

mysql -u root < /var/mysql_init.sql
mysql wordpress -u root < /var/mysql_wordpress.sql

/etc/init.d/mariadb stop

#/usr/bin/mysqld_safe --datadir='/var/lib/mysql'
/usr/bin/supervisord -c /etc/supervisord.conf
