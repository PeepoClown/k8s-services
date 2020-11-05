FROM alpine:latest
LABEL maintainer="wupdegra@student.21-school.ru"

# update & install packages
RUN apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add	nginx \
			wget \
			php7 php7-fpm php7-mysqli \
			php7-common php7-cli php7-mbstring \
			php7-json php7-curl php7-gd \
			php7-xml php7-xmlrpc php7-zip \
			php7-session \
			supervisor

VOLUME [ "/sys/fs/cgroup" ]

# configure nginx
RUN adduser -D -g 'www' www && \
	mkdir -p /run/nginx /run/php && \
	rm -rf /etc/nginx/nginx.conf

# copy sources
COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/supervisord.conf /etc/supervisord.conf

# install pma
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz && \
	tar -xzvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
	mv phpMyAdmin-5.0.2-all-languages /www && \
	rm -rf phpMyAdmin-5.0.2-all-languages.tar.gz
COPY srcs/phpmyadmin.php /www/config.inc.php
RUN chmod -R 755 /www

EXPOSE 5000

# run container
COPY srcs/setup.sh /var/setup.sh
RUN chmod 755 /var/setup.sh

CMD sh /var/setup.sh
