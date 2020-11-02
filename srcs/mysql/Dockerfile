FROM alpine:latest
LABEL maintainer="wupdegra@student.21-school.ru"

# update & install packages
RUN apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add	mariadb \
			mariadb-client \
			openrc --no-cache

VOLUME [ "/sys/fs/cgroup" ]
VOLUME [ "/var/lib/mysql" ]

# copy sources
COPY srcs/mysql_init.sql /var/mysql_init.sql
COPY srcs/mysql_wordpress.sql /var/mysql_wordpress.sql
COPY srcs/my.cnf /etc/mysql/my.cnf

RUN chmod 744 /etc/mysql/my.cnf

EXPOSE 3306

# setup db
RUN	openrc default && \
	/etc/init.d/mariadb setup && \
	/etc/init.d/mariadb start && \
	mysql -u root < /var/mysql_init.sql && \
	mysql wordpress -u root < /var/mysql_wordpress.sql && \
	/etc/init.d/mariadb stop

# run container
COPY srcs/setup.sh /var/setup.sh
RUN chmod 755 /var/setup.sh

ENTRYPOINT [ "/var/setup.sh" ]
