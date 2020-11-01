FROM alpine:latest
LABEL maintainer="wupdegra@student.21-school.ru"

# update & install packages
RUN apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add	wget \
			influxdb \
			supervisor --no-cache

# install glibc
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
	wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk && \
	apk add glibc-2.32-r0.apk

# install telegraf
RUN	wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.1_static_linux_amd64.tar.gz && \
	tar -xzf telegraf-1.16.1_static_linux_amd64.tar.gz && \
	cp -r /telegraf-1.16.1/* / && \
	rm -rf /telegraf-1.16.1/ telegraf-1.16.1_static_linux_amd64.tar.gz && \
	./usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

COPY srcs/supervisord.conf /etc/supervisord.conf

VOLUME [ "/var/lib/influxdb" ]
EXPOSE 8086

# run container
COPY srcs/setup.sh /var/setup.sh
RUN chmod 755 /var/setup.sh

ENTRYPOINT [ "/var/setup.sh" ]
