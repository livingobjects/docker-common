FROM debian:latest

RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup && \
	echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache && \
    echo "APT::Install-Recommends \"0\";" > /etc/apt/apt.conf.d/no-recommends && \
	echo "APT::Install-Suggests \"0\";" >> /etc/apt/apt.conf.d/no-recommends && \
	echo "Dpkg::Options { \"--force-confdef\"; \"--force-confold\"; }" >> /etc/apt/apt.conf.d/local && \

# Install minimal packages
	export DEBIAN_FRONTEND=noninteractive && \
	apt-get -y update && \
	apt-get -y install runit wget bzip2 unzip vim netcat locales && \
	rm -Rf /etc/sv/* && \
	apt-get clean && \
	apt-get autoclean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \

# Set locale
	echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen && \
	locale-gen fr_FR.UTF-8 && update-locale LANG=fr_FR.UTF-8 && \

# Set timezone
	ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
	echo "Europe/Prague" > /etc/timezone && \

# Create lo-daemon
    groupadd -g 999 lo-daemon && \
    useradd lo-daemon --uid 999 --gid 999 --system --home /services/ --shell /bin/bash && \
    gpasswd -a lo-daemon lo-logger

# Set env vars
ENV LANG=fr_FR.UTF-8 \
	LANGUAGE=fr_FR:fr \
	LC_ALL=fr_FR.UTF-8



ADD mysql-apt-config_0.3.3-2debian7_all.deb /mysql-apt-config_0.3.3-2debian7_all.deb
RUN export DEBIAN_FRONTEND="noninteractive" && \
	echo "mysql-apt-config mysql-apt-config/select-product select Server" | debconf-set-selections && \
	echo "mysql-apt-config mysql-apt-config/select-server select mysql-5.6" | debconf-set-selections && \
	dpkg -i mysql-apt-config_0.3.3-2debian7_all.deb &&\
	echo "mysql-server mysql-server/root_password password root" | debconf-set-selections && \
    echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections && \
	apt-get -y update && \
    apt-get -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"  install perl-modules mysql-server mysql-client && \
    rm -rf /var/lib/mysql/* && \ 
    apt-get clean && \ 
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /mysql-apt-config_0.3.3-2debian7_all.deb

# Add MySQL configuration
ADD mysql/ /etc/mysql/

# Install services
ADD services /etc/sv
RUN chmod +x /etc/sv/**/run

# Add VOLUMEs to allow backup of config and databases
VOLUME ["/etc/mysql", "/var/lib/mysql"]

CMD ["/usr/bin/runsvdir", "-P", "/etc/sv"]

EXPOSE 3306
