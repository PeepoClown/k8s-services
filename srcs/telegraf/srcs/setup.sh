#!/bin/sh

#/usr/bin/supervisord -c /etc/supervisord.conf
rc default
telegraf --config /tmp/telegraf.conf
