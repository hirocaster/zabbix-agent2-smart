FROM zabbix/zabbix-agent2:ubuntu-7.0-latest

USER root

RUN apt-get update && \
    apt-get install -y smartmontools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN usermod -aG disk zabbix
RUN chmod +s /usr/sbin/smartctl

# Don't use sudo in smart plugin
RUN echo "Plugins.Smart.ExecuteSudo=0" >> /etc/zabbix/zabbix_agent2.d/plugins.d/smart.conf && \
    echo "Plugins.Smart.Path=/usr/sbin/smartctl" >> /etc/zabbix/zabbix_agent2.d/plugins.d/smart.conf

USER zabbix
