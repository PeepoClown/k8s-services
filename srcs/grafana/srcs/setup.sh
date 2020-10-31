#!/bin/sh

/usr/bin/supervisord -c /etc/supervisord.conf


# mkdir /etc/telegraf
# cp /etc/telegraf.conf /etc/telegraf/telegraf.conf
# sed -i "s~# database = \"telegraf\"~database = \"grafana\"~g" /etc/telegraf/telegraf.conf
# sed -i "s~# urls = \[\"unix:///var/run/influxdb.sock\"\]~urls = \[\"http://influxdb-service:8086\"\]~g" /etc/telegraf/telegraf.conf
# telegraf &

# ./bin/grafana-server
