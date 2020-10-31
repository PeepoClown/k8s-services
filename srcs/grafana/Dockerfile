FROM alpine:latest
LABEL maintainer="wupdegra@student.21-school.ru"

# update & install packages
RUN apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add	wget \
			supervisor --no-cache

# install glibc
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
	wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk && \
	apk add glibc-2.32-r0.apk

# install grafana
RUN wget https://dl.grafana.com/oss/release/grafana-7.2.2.linux-amd64.tar.gz && \
	tar -xzvf grafana-7.2.2.linux-amd64.tar.gz && \
	mv grafana-7.2.2 /grafana && \
	rm -rf grafana-7.2.2.linux-amd64.tar.gz

# install telegraf
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --no-cache && \
	mkdir /etc/telegraf

# copy sources
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY srcs/supervisord.conf /etc/supervisord.conf
# COPY srcs/grafana.db /grafana/data/grafana.db

EXPOSE 3000

# run container
COPY srcs/setup.sh /var/setup.sh
RUN chmod 755 /var/setup.sh

WORKDIR /grafana/bin/
ENTRYPOINT [ "/var/setup.sh" ]
