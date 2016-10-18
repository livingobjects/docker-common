FROM livingobjects/base:3.3_2

# Install Server
RUN apk --update rsyslog logrotate && \
    rm -rf /var/cache/apk/*

ADD rsyslog.conf /etc/

