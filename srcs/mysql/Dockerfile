FROM alpine:latest
LABEL maintainer="wupdegra@student.21-school.ru"

# update & install packages
RUN apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add	mariadb \
			mariadb-client \
			openrc --no-cache

VOLUME [ "/var/lib/mysql" ]

RUN mkdir -p /run/mysqld

# copy sources
COPY srcs/mysql_init.sql /var/mysql_init.sql
COPY srcs/mysql_wordpress.sql /var/mysql_wordpress.sql
COPY srcs/my.cnf /etc/mysql/my.cnf

RUN chmod 755 /etc/mysql/my.cnf

EXPOSE 3306

# run container
COPY srcs/setup.sh /var/setup.sh
RUN chmod 755 /var/setup.sh

ENTRYPOINT [ "/var/setup.sh" ]
