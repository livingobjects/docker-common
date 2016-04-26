FROM livingobjects/jre8:8u91

# Update dependency
RUN apk --update add tcpdump net-snmp-tools libcap findutils coreutils && \

    # Add capacity for non root users to access tcpdump
    addgroup pcap  && \
    addgroup lo-daemon pcap  && \
    addgroup root pcap && \

    chgrp pcap /usr/sbin/tcpdump  && \
    chmod 750 /usr/sbin/tcpdump  && \
# setcap not possible on docker hub, it appears that they are using aufs as storage backend
#    setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump  && \
    ln -s /usr/sbin/tcpdump /usr/local/bin/tcpdump  && \

    # add gcc-libs for jav8 (latest v8 javascript engine)
    apk add -U xz curl tar && \
    curl -Ls https://www.archlinux.org/packages/core/x86_64/gcc-libs/download > /tmp/gcc-libs.tar.gz && mkdir /usr/libgcc && tar -xvf /tmp/gcc-libs.tar.gz -C /usr/libgcc && \
    echo /usr/libgcc/usr/lib >> /etc/ld.so.conf && \
    /usr/glibc/usr/bin/ldconfig && \
    apk del --purge xz curl tar && \

    # Add sudo without password for docker with AUFS
    apk add sudo && \
    rm -rf /var/cache/apk/* /tmp/* && \
    echo 'lo-daemon  ALL=(ALL)       NOPASSWD: /usr/sbin/tcpdump' >> /etc/sudoers && \
    visudo -c -x /etc/sudoers

