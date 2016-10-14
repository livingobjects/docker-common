FROM livingobjects/base:3.3_2

COPY    APKBUILD /home/packager/APKBUILD
COPY    install.sh /home/packager/install.sh

RUN     chmod u+x /home/packager/install.sh && \
        apk -U upgrade && \
        /home/packager/install.sh && \
        chown -R nginx:nginx /var/lib/nginx/ && \
        rm -rf /var/cache/apk/*

# Define mountable directories.
VOLUME ["/etc/nginx/certs", "/var/log/nginx"]

# Define working directory.
RUN rm -rf /etc/nginx/conf.d/*.conf

# Print logs on stdout and stderr

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

COPY etc /etc/

# Expose ports.
EXPOSE 80 443
