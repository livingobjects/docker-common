FROM alpine:3.3

ADD run-one /usr/bin/run-one

RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \

# Install minimal packages
	apk update && \
	apk add runit@testing wget bzip2 unzip bash tzdata && \

# Set timezone
	cp /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
	echo "Europe/Prague" > /etc/timezone && \
	apk del tzdata && \

# Create lo-daemon
    addgroup -g 999 lo-daemon && \
    adduser lo-daemon -D -u 999 -G lo-daemon -S -h /services/ -s /bin/bash && \

# Alpine nsswitch: tells the C lib to look first at the /etc/hosts  files
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
    rm -rf /var/cache/apk/*


# Set env vars
ENV LANG=fr_FR.UTF-8 \
	LANGUAGE=fr_FR:fr \
	LC_ALL=fr_FR.UTF-8

CMD ["/sbin/runsvdir", "-P", "/etc/sv"]