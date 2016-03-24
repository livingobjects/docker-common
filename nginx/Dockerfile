FROM livingobjects/base:3.3_1

RUN apk --update add nginx && \
    chown -R nginx:nginx /var/lib/nginx/ && \
    rm -rf /var/cache/apk/*

# Define mountable directories.
VOLUME ["/etc/nginx/certs", "/var/log/nginx"]

# Define working directory.
RUN rm -rf /etc/nginx/conf.d/*.conf
COPY etc /etc/

# Expose ports.
EXPOSE 80 443
