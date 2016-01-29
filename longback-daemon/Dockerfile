FROM livingobjects/jre8:8u71

ENV OSGI_LAUNCHER_VERSION=1.0 \
    OSGI_RUNTIME_VERSION=1.0 \
    LO_JACKSON_RUNTIME_VERSION=2.4.4 \
    LO_WISDOM_VERSION=0.9.1_1 \
    WISDOM_MONITOR_APP_VERSION=0.9.1_1

ADD archives.tar.gz /

# Install OSGi launcher
RUN mkdir -p /services/longback-daemon && \
    tar xzf /archives/osgi-launcher-${OSGI_LAUNCHER_VERSION}.tar.gz -C /services/longback-daemon && \

# Install OSGi runtime
    mkdir -p /services/longback-daemon/core && \
    tar xzf /archives/osgi-runtime-${OSGI_RUNTIME_VERSION}.tar.gz -C /services/longback-daemon/core && \

# Install Jackson runtime
    mkdir -p /services/longback-daemon/runtime/jackson && \
    tar xzf /archives/lo-jackson-runtime-${LO_JACKSON_RUNTIME_VERSION}.tar.gz -C /services/longback-daemon/runtime/jackson && \

# Install Wisdom
    mkdir -p /services/longback-daemon/runtime/wisdom && \
    tar xzf /archives/lo-wisdom-runtime-${LO_WISDOM_VERSION}.tar.gz -C /services/longback-daemon/runtime/wisdom && \


# Install Wisdom Monitor
    mkdir -p /services/longback-daemon/application/wisdom-monitor/dependencies && \
    tar xzf /archives/wisdom-monitor-${WISDOM_MONITOR_APP_VERSION}.tar.gz -C /services/longback-daemon/application/wisdom-monitor/ && \
    tar xzf /archives/wisdom-monitor-deps-${WISDOM_MONITOR_APP_VERSION}.tar.gz -C /services/longback-daemon/application/wisdom-monitor/dependencies && \
    chown lo-daemon.lo-daemon -R /services/longback-daemon/application/wisdom-monitor/ && \
    rm -rf /archives


# Parameterize environment
ADD run.sh /services/longback-daemon/
RUN chmod 755 /services/longback-daemon/run.sh && \
    ln -s /services/longback-daemon/run.sh /services/longbackd && \
    ln -s /services/longback-daemon/run.sh /services/run.sh

ADD conf /services/longback-daemon/conf
ADD wisdom-templates /services/longback-daemon/templates

RUN chmod 755 /services/longback-daemon/conf/ && \
    chmod 640 /services/longback-daemon/conf/* && \
# Chown all
    chown lo-daemon.lo-daemon -R /services/

# Add util script to run wisdom shell
ADD wisdom-shell /usr/bin/
ADD wisdom-shell-clean /usr/bin/

EXPOSE 9000

