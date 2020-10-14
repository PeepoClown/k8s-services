FROM alpine:latest
LABEL maintainer="wupdegra@student.21-school.ru"

# update & install packages
RUN apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add	nginx \
			php7.3 php-fpm php-mysql \
			php-common php-cli php-mbstring \
			supervisor

RUN mkdir -p /run/nginx && \
	mkdir -p /run/php

# copy sources
COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/supervisord.conf /etc/supervisord.conf

# install wordpress
COPY srcs/wordpress.tar.gz ./wordpress.tar.gz
RUN	tar -xzvf ./wordpress.tar.gz && \
	mv ./wordpress /var/www/wordpress && \
	chmod 755 /var/www/wordpress && \
	rm -rf ./wordpress.tar.gz

EXPOSE 5050

# run container
COPY srcs/setup.sh /var/setup.sh
RUN chmod 755 /var/setup.sh

ENTRYPOINT [ "/var/setup.sh" ]
