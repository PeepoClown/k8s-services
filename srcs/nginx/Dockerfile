FROM alpine:latest

LABEL maintainer="wupdegra@student.21-school.ru"

RUN apk update --no-cache && \
	apk upgrade --no-cache

RUN apk add --no-cache nginx \
					   openssl \
					   openssh \
					   supervisor

RUN adduser -D -g 'www' www && \
	mkdir -p /www /run/nginx && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www

RUN adduser -D wupdegra && \
	echo "wupdegra:12345" | chpasswd && \
	ssh-keygen -A

RUN openssl req -x509 -nodes -days 90 -newkey rsa:2048 \
	-subj '/C=RU/ST=Moscow/O=21School/CN=wupdegra' \
	-keyout /etc/ssl/localhost.key \
	-out /etc/ssl/localhost.crt

COPY srcs/index.html /var/www/localhost/htdocs/
COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY srcs/sshd_config /etc/ssh/sshd_config
COPY srcs/supervisord.conf /etc/supervisord.conf
COPY srcs/setup.sh /tmp/setup.sh

EXPOSE 80 443 22

CMD ["sh", "-c", "/tmp/setup.sh ; /usr/bin/supervisord -c /etc/supervisord.conf"]