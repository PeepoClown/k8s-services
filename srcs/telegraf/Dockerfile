FROM alpine:latest
LABEL maintainer="wupdegra@student.21-school.ru"

# update & install packages
RUN apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add	wget \
			supervisor \
			openrc

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
	wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk && \
	apk add glibc-2.32-r0.apk && \
	echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && apk update && \
	apk add telegraf

# copy sources
COPY srcs/supervisord.conf /etc/supervisord.conf
COPY srcs/telegraf.conf /tmp/telegraf.conf

# run container
COPY srcs/setup.sh /var/setup.sh
RUN chmod 755 /var/setup.sh

ENTRYPOINT [ "/var/setup.sh" ]
