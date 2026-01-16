FROM zabbix/zabbix-agent2:ubuntu-7.0-latest

USER root

RUN apt-get update && \
    apt-get install -y smartmontools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN usermod -aG disk zabbix
RUN echo "zabbix ALL=(root) NOPASSWD: /usr/sbin/smartctl" >> /etc/sudoers && \
    sed -i 's/^Defaults\s\+requiretty/#Defaults requiretty/g' /etc/sudoers || true

USER zabbix
