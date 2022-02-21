#!/bin/bash
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
echo "***INSTALLATION DE GRAFANA***"
echo "*********Download grafana*********"
sudo wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_5.0.4_amd64.deb
echo "*********Install libfontconfig*********"
sudo apt-get install -y adduser libfontconfig
echo "*********Unpack Depackage Grafana*********"
sudo dpkg -i grafana_5.0.4_amd64.deb
echo "*********Enable the automatic start of Grafana by systemd*********"
sudo systemctl daemon-reload && sudo systemctl enable grafana-server && sudo systemctl start grafana-server
echo "*********Grafana service status*********"
sudo systemctl status grafana-server