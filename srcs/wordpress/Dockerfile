FROM alpine:latest
LABEL maintainer="wupdegra@student.21-school.ru"

# update & install packages
RUN apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add	nginx \
			php7 php7-fpm php7-mysqli \
			php7-common php7-cli php7-mbstring \
			php7-json php7-curl php7-gd \
			php7-intl php7-mbstring php7-soap php7-xml php7-xmlrpc \
			php7-zip php7-json php7-mbstring \
			supervisor openrc

# configure nginx
RUN adduser -D -g 'www' www && \
	mkdir -p /run/nginx /run/php /var/www/localhost/ && \
	rm -rf /etc/nginx/conf.d/defaullt.conf

# copy sources
COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/supervisord.conf /etc/supervisord.conf

# install wordpress
# COPY srcs/wordpress.tar.gz ./wordpress.tar.gz
# RUN	tar -xzvf ./wordpress.tar.gz && \
# 	mv ./wordpress /var/www/wordpress && \
# 	chown -R www:www /var/www/* && \
# 	chmod 755 /var/www/* && \
# 	rm -rf ./wordpress.tar.gz

RUN wget https://wordpress.org/latest.tar.gz \
	&& tar -xzvf latest.tar.gz \
	&& mv wordpress /var/www/localhost/ \
	&& rm -rf latest.tar.gz
COPY srcs/wp-config.php	/var/www/wordpress/wp-config.php
RUN chown -R www:www /var/www/* && \
	chmod -R 755 /var/www/*

EXPOSE 5050

# run container
COPY srcs/setup.sh /var/setup.sh
RUN chmod 755 /var/setup.sh

ENTRYPOINT [ "/var/setup.sh" ]
