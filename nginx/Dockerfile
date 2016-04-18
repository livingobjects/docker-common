FROM livingobjects/base:3.3_1

COPY    APKBUILD /home/packager/APKBUILD
COPY    install.sh /home/packager/install.sh

RUN     chmod u+x /home/packager/install.sh && \
        apk -U upgrade && \
        /home/packager/install.sh

# Define mountable directories.
VOLUME ["/etc/nginx/certs", "/var/log/nginx"]

# Define working directory.
RUN rm -rf /etc/nginx/conf.d/*.conf
COPY etc /etc/

# Expose ports.
EXPOSE 80 443
