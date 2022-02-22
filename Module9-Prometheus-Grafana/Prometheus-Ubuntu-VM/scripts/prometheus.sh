#!/bin/bash
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
echo "***INSTALLATION DE PROMETHEUS***"
#echo "*******Updates*********"
#sudo apt-get update -y 
echo "*********User creation*********"
sudo useradd  --no-create-home --shell /usr/sbin/nologin prometheus  
echo "*********Create folders for conf and lib*********"
sudo mkdir /etc/prometheus 
sudo mkdir /var/lib/prometheus 
echo "*********Set ownership*********"
sudo chown prometheus:prometheus /etc/prometheus 
sudo chown prometheus:prometheus /var/lib/prometheus 

echo "*********Download Prometheus archive*********"
wget https://github.com/prometheus/prometheus/releases/download/v2.2.1/prometheus-2.2.1.linux-amd64.tar.gz
echo "*********Unpack the downloaded archive*********"
sudo tar xfz prometheus-2.2.1.linux-amd64.tar.gz > /dev/null
#cd prometheus-2.2.1.linux-amd64
echo " *********Copy the binary files into the /usr/local/bin/ directory:*********"
sudo cp prometheus-2.2.1.linux-amd64/prometheus /usr/local/bin > /dev/null
sudo cp prometheus-2.2.1.linux-amd64/promtool /usr/local/bin > /dev/null
echo " *********Set the ownership of these files to the prometheus user previously created*********"
sudo chown prometheus:prometheus  /usr/local/bin/prometheus > /dev/null
sudo chown prometheus:prometheus  /usr/local/bin/promtool > /dev/null
echo " *********Copy the consoles and console_libraries directories to /etc/prometheus:*********"
sudo cp -r  prometheus-2.2.1.linux-amd64/consoles /etc/prometheus
sudo cp  -r prometheus-2.2.1.linux-amd64/console_libraries /etc/prometheus
echo " *********Set the ownership*********"
sudo chown -R prometheus:prometheus  /etc/prometheus/consoles
sudo chown -R prometheus:prometheus  /etc/prometheus/console_libraries
echo "*********Remove the leftover files*********"
rm -rf prometheus-2.2.1.linux-amd64.tar.gz prometheus-2.2.1.linux-amd64
echo " *********Create service with systemd*********"

cat <<EOF | sudo tee /etc/prometheus/prometheus.yml

global:
  scrape_interval:     15s
  evaluation_interval: 15s

rule_files:
  # - "first.rules"
  # - "second.rules"

scrape_configs:
  - job_name: 'prometheus'
    scrape_interval: 5s
    static_configs:
      - targets: ['172.17.8.104:9090']
  - job_name: 'node1'
    scrape_interval: 5s
    static_configs:
      - targets: ['172.17.8.104:9100']
  - job_name: 'node2'
    scrape_interval: 5s
    static_configs:
      - targets: ['172.17.8.105:9100']

EOF


echo " *********Permissions and ownership*********"
sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml

echo " *********Service creation*********"
echo '
[Unit]
Description=Prometheus Monitoring
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
--config.file /etc/prometheus/prometheus.yml \
--storage.tsdb.path /var/lib/prometheus/ \
--web.console.templates=/etc/prometheus/consoles \
--web.console.libraries=/etc/prometheus/console_libraries
ExecReload=/bin/kill -HUP $MAINPID

[Install]
WantedBy=multi-user.target' > /etc/systemd/system/prometheus.service

echo " *********Start at boot*********"
sudo  systemctl daemon-reload
sudo systemctl enable --now prometheus
echo " *********Verify service status*********"
sudo  systemctl status prometheus