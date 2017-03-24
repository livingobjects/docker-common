FROM livingobjects/debian-base:8.7

ENV DEBIAN_FRONTEND noninteractive

ADD mysql-apt-config_0.8.3-1_all.deb /mysql-apt-config_0.8.3-1_all.deb

RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup && \
    echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache && \
    echo "APT::Install-Recommends \"0\";" > /etc/apt/apt.conf.d/no-recommends && \
    echo "APT::Install-Suggests \"0\";" >> /etc/apt/apt.conf.d/no-recommends && \
    echo "Dpkg::Options { \"--force-confdef\"; \"--force-confold\"; }" >> /etc/apt/apt.conf.d/local && \
    # MySQL conf
    echo "mysql-apt-config mysql-apt-config/select-product select Server" | debconf-set-selections && \
    echo "mysql-apt-config mysql-apt-config/select-server select mysql-5.6" | debconf-set-selections && \
    echo "mysql-server mysql-server/root_password password root" | debconf-set-selections && \
    echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections && \
    apt-get -y update && apt-get install -y --no-install-recommends \
    lsb-release && \
    dpkg -i mysql-apt-config_0.8.3-1_all.deb && \
    apt-get install -y --no-install-recommends \
    perl-modules \
    mysql-server \
    mysql-client && \
    apt-get autoclean && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /mysql-apt-config_0.3.3-2debian7_all.deb /var/lib/mysql/

# Add MySQL configuration
ADD mysql/ /etc/mysql/

# Install services
ADD services /etc/sv
RUN chmod +x /etc/sv/**/run

# Add VOLUMEs to allow backup of config and databases
VOLUME ["/etc/mysql", "/var/lib/mysql"]

CMD ["/usr/bin/runsvdir", "-P", "/etc/sv"]

EXPOSE 3306
