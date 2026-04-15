#!/bin/bash
set -e

echo "=== Setup NAT Agent ==="

# Prepare directories
mkdir -p /opt /var/log

# Download binary
curl -L --retry 5 --retry-delay 3 \
  -o /opt/nat-agent \
  https://raw.githubusercontent.com/HuynhBui/vnetwork-metrics-exporter/main/nat-agent

# Permission
chmod +x /opt/nat-agent

# Create log files
touch /var/log/nat-agent.log
touch /var/log/nat-agent.err

# Install systemd service
curl -L -o /etc/systemd/system/nat-agent.service \
  https://raw.githubusercontent.com/HuynhBui/vnetwork-metrics-exporter/main/systemd/nat-agent.service

# Reload systemd
systemctl daemon-reload

# Enable & start
systemctl enable nat-agent
systemctl start nat-agent

echo "=== NAT Agent started ==="
