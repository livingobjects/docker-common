FROM livingobjects/debian-base:8.7_2

# Based on https://github.com/nginxinc/docker-nginx

# Docker Build Arguments
ARG NGINX_VERSION="1.12.0-1~jessie"
ARG NGINX_KEY="ABF5BD827BD9BF62"

RUN echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $NGINX_KEY && \
    apt-get -y update && apt-get install -y --no-install-recommends \
	nginx=$NGINX_VERSION \ && \
	rm -rf /etc/nginx/conf.d/*.conf && \
	apt-get autoclean && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# Define mountable directories.
VOLUME ["/etc/nginx/certs", "/var/log/nginx"]

COPY etc /etc/

# Expose ports.
EXPOSE 80 443