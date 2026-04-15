#!/bin/bash
set -e

mkdir -p /opt /var/log/vpn

curl -L --retry 5 --retry-delay 3 \
  -o /opt/vpn-agent \
  https://raw.githubusercontent.com/HuynhBui/vnetwork-metrics-exporter/main/vpn-agent

chmod +x /opt/vpn-agent

# install service
curl -L -o /etc/systemd/system/vpn-agent.service \
  https://raw.githubusercontent.com/HuynhBui/vnetwork-metrics-exporter/main/systemd/vpn-agent.service

systemctl daemon-reload
systemctl enable vpn-agent
systemctl start vpn-agent
