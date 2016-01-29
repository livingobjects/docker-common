FROM livingobjects/base:3.3

RUN apk --update add nginx && \
    chown -R nginx:nginx /var/lib/nginx/ && \
    rm -rf /var/cache/apk/*

# Define mountable directories.
VOLUME ["/etc/nginx/certs", "/var/log/nginx"]

# Define working directory.
WORKDIR /etc/nginx
RUN rm -rf /etc/nginx/conf.d/*.conf
ADD proxy.conf /etc/nginx/proxy.conf
ADD nginx.conf /etc/nginx/nginx.conf
ADD services /etc/sv

# Expose ports.
EXPOSE 80
EXPOSE 443
