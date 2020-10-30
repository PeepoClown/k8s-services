# FROM alpine:latest
# LABEL maintainer="wupdegra@student.21-school.ru"

# # update & install packages
# RUN apk update --no-cache && \
# 	apk upgrade --no-cache && \
# 	apk add	wget --no-cache

# # install glibc
# RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
# 	wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk && \
# 	apk add glibc-2.32-r0.apk

# RUN printf "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories 	&& apk add grafana@testing

# # install grafana
# RUN wget https://dl.grafana.com/oss/release/grafana-7.2.2.linux-amd64.tar.gz && \
# 	tar -xzvf grafana-7.2.2.linux-amd64.tar.gz && \
# 	mv grafana-7.2.2 /grafana && \
# 	rm -rf grafana-7.2.2.linux-amd64.tar.gz
# 	cp /grafana/conf/defaults.ini /etc/grafana.ini

# # copy sources
# COPY srcs/grafana.db /grafana/data/grafana.db
# COPY srcs/grafana.ini /etc/grafana/grafana.ini

# COPY ds.yaml /usr/share/grafana/conf/provisioning/datasources/ds1.yaml
# RUN rm -rf /usr/share/grafana/public/dashboards/home.json
# COPY home.json /usr/share/grafana/public/dashboards/home.json

# EXPOSE 3000

# # run container
# COPY srcs/setup.sh /var/setup.sh
# RUN chmod 755 /var/setup.sh

# WORKDIR /grafana/bin/

# ENTRYPOINT [ "/var/setup.sh" ]


FROM alpine:latest
RUN apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add	wget --no-cache \
	telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
	--repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

ADD https://dl.grafana.com/oss/release/grafana-7.2.2.linux-amd64.tar.gz ./
RUN tar -xvf grafana*tar* --strip-components 1
RUN rm -rf ./grafana*tar*

#ADD grafana.db ./data/

COPY srcs/setup.sh /var/setup.sh
RUN chmod 755 /var/setup.sh

EXPOSE 3000

ENTRYPOINT [ "/var/setup.sh" ]