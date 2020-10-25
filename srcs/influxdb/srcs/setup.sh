#!/bin/sh

#/usr/bin/supervisord -c /etc/supervisord.conf
rc default
influxd -config /etc/influxdb.conf