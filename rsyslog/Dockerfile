FROM livingobjects/base:3.3_2

# Install Server
RUN apk update && \
    apk add rsyslog logrotate && \
    rm -rf /var/cache/apk/*

EXPOSE 514 514/udp

VOLUME [ "/var/log", "/etc/rsyslog.d" ]

ADD rsyslog.conf /etc/
ADD rsyslog.d /etc/

ENTRYPOINT [ "rsyslogd", "-n" ]

