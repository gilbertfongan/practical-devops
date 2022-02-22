#!/bin/bash
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
echo "***INSTALLATION DE NODE_EXPORTER***"
echo "*******Updates*********"
sudo apt-get update -y 
echo "*********User creation*********"
sudo useradd  --no-create-home --shell /usr/bin/false node_exporter  
echo "********* Download Node Exporter archive*********"
wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz
echo "*********Unpack the downloaded archive to /usr/local/bin*********"
sudo tar --strip-components=1 -xf node_exporter-1.0.1.linux-amd64.tar.gz -C /usr/local/bin/
echo "*********Assign ownership of the /usr/local/bin/node_exporter folder to the previously created node_exporter user*********"
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
echo "*********Remove the leftover files*********"
rm -rf node_exporter-1.0.1.linux-amd64.tar.gz node_exporter-1.0.1.linux-amd64
echo "*********Create service with systemd*********"
echo '
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter \
    --collector.cpu \
    --collector.diskstats \
    --collector.filesystem \
    --collector.loadavg \
    --collector.meminfo \
    --collector.filefd \
    --collector.netdev \
    --collector.stat \
    --collector.netstat \
    --collector.systemd \
    --collector.uname \
    --collector.vmstat \
    --collector.time \
    --collector.tcpstat \
    --collector.hwmon \
    --collector.arp \
    --web.max-requests=40 \
    --web.listen-address=0.0.0.0:9100 \
    --web.telemetry-path=/metrics

SyslogIdentifier=node_exporter
Restart=always

[Install]
WantedBy=multi-user.target' > /etc/systemd/system/node_exporter.service


echo "*********Permissions and ownership*********"
sudo chown -R node_exporter:node_exporter /etc/systemd/system/node_exporter.service
sudo chmod 0644 /etc/systemd/system/node_exporter.service
echo "*********Service execute at Boot*********"
sudo  systemctl daemon-reload
sudo systemctl enable --now node_exporter
echo "*********Verify service status*********"
sudo  systemctl status node_exporter