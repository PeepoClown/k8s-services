FROM alpine:latest
LABEL maintainer="wupdegra@student.21-school.ru"

# update & install packages
RUN apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add	wget \
			supervisor --no-cache

# install grafana
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
	wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk && \
	apk add glibc-2.32-r0.apk
RUN wget https://dl.grafana.com/oss/release/grafana-7.2.0.linux-amd64.tar.gz && \
	tar -xzvf grafana-7.2.0.linux-amd64.tar.gz && \
	mv grafana-7.2.0 /grafana && \
	rm -rf grafana-7.2.0.linux-amd64.tar.gz && \
	cp /grafana/conf/defaults.ini /etc/grafana.ini

# copy sources
COPY srcs/supervisord.conf /etc/supervisord.conf
#COPY srcs/grafana.ini /etc/grafana/grafana.ini

#RUN cp /grafana/conf/defaults.ini /etc/grafana.ini

EXPOSE 3000

# run container
COPY srcs/setup.sh /var/setup.sh
RUN chmod 755 /var/setup.sh

ENTRYPOINT [ "/var/setup.sh" ]
