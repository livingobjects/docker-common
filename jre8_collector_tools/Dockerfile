FROM livingobjects/jre8:8u77

ADD run-one /usr/bin/run-one

# Update dependency
RUN chmod +x /usr/bin/run-one && \
    apk --update add tcpdump net-snmp-tools libcap findutils coreutils && \

    # Add capacity for non root users to access tcpdump
    addgroup pcap  && \
    addgroup lo-daemon pcap  && \
    addgroup root pcap && \

    chgrp pcap /usr/sbin/tcpdump  && \
    chmod 750 /usr/sbin/tcpdump  && \
# setcap not possible on docker hub, it appears that they are using aufs as storage backend
#    setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump  && \
    ln -s /usr/sbin/tcpdump /usr/local/bin/tcpdump  && \


    # Add sudo without password for docker with AUFS
    apk add sudo && \
    rm -rf /var/cache/apk/* && \
    echo 'lo-daemon  ALL=(ALL)       NOPASSWD: /usr/sbin/tcpdump' >> /etc/sudoers && \
    visudo -c -x /etc/sudoers

