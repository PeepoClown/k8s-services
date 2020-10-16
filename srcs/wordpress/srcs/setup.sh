#!/bin/sh

# rc default
# /usr/bin/supervisord -c /etc/supervisord.conf
php --server 0.0.0.0:5050 --docroot /www/
#php -S 0.0.0.0:5050 -t /www/wordpress/