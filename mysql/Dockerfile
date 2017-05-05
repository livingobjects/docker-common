FROM livingobjects/debian-base:8.7_1

ADD mysql-apt-config_0.3.3-2debian7_all.deb /mysql-apt-config_0.3.3-2debian7_all.deb

RUN apt-get -y update && \
    apt-get install -y lsb-release && \
    echo "mysql-apt-config mysql-apt-config/select-product select Server" | debconf-set-selections && \
    echo "mysql-apt-config mysql-apt-config/select-server select mysql-5.6" | debconf-set-selections && \
    dpkg -i mysql-apt-config_0.3.3-2debian7_all.deb && \
    echo "mysql-server mysql-server/root_password password root" | debconf-set-selections && \
    echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections && \
    apt-get -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"  install perl-modules mysql-server mysql-client && \
    apt-get autoclean && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /mysql-apt-config_0.3.3-2debian7_all.deb /var/lib/mysql/*

# Add MySQL configuration
ADD mysql/ /etc/mysql/

# Install services
ADD services /etc/sv
RUN chmod +x /etc/sv/**/run

# Add VOLUMEs to allow backup of config and databases
VOLUME ["/etc/mysql", "/var/lib/mysql"]

EXPOSE 3306