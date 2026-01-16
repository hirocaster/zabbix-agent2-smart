FROM zabbix/zabbix-agent2:ubuntu-7.0-latest

USER root

RUN apt-get update && \
    apt-get install -y smartmontools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN usermod -aG disk zabbix
RUN chmod +s /usr/sbin/smartctl

# Don't use sudo in smart plugin
RUN echo '#!/bin/sh\nshift\nexec "$@"' > /usr/bin/sudo && \
    chmod +x /usr/bin/sudo

USER zabbix
