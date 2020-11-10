FROM alpine:latest
LABEL maintainer="wupdegra@student.21-school.ru"

# update & install packages
RUN apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add	wget \
			influxdb \
			supervisor --no-cache

VOLUME [ "/var/lib/influxdb" ]

# install telegraf
RUN	wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.1_static_linux_amd64.tar.gz && \
	tar -xzf telegraf-1.16.1_static_linux_amd64.tar.gz && \
	cp -r /telegraf-1.16.1/* / && \
	rm -rf /telegraf-1.16.1/ telegraf-1.16.1_static_linux_amd64.tar.gz

# copy sources
COPY srcs/supervisord.conf /etc/supervisord.conf
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 8086

# run container
COPY srcs/setup.sh /var/setup.sh
RUN chmod 755 /var/setup.sh

ENTRYPOINT [ "/var/setup.sh" ]
