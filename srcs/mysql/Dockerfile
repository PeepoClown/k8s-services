FROM alpine:latest
LABEL maintainer="wupdegra@student.21-school.ru"

# update & install packages
RUN apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add	mariadb \
			mariadb-client \
			openrc \
			supervisor --no-cache

RUN mkdir -p /run/mysqld

# install telegraf
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --no-cache && \
	mkdir /etc/telegraf

# copy sources
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY srcs/supervisord.conf /etc/supervisord.conf
COPY srcs/mysql_init.sql /var/mysql_init.sql
COPY srcs/mysql_wordpress.sql /var/mysql_wordpress.sql
COPY srcs/my.cnf /etc/mysql/my.cnf

RUN chmod 755 /etc/mysql/my.cnf

VOLUME [ "/var/lib/mysql" ]
EXPOSE 3306

# run container
COPY srcs/setup.sh /var/setup.sh
RUN chmod 755 /var/setup.sh

ENTRYPOINT [ "/var/setup.sh" ]
