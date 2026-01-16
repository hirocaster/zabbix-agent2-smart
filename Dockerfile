FROM zabbix/zabbix-agent2:ubuntu-7.0-latest

USER root

RUN apt-get update && \
    apt-get install -y smartmontools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN usermod -aG disk zabbix
RUN chmod +s /usr/sbin/smartctl

USER zabbix
