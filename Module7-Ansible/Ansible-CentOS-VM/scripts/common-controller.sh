#!/bin/bash
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
echo "*** COMMON INSTALLATION-CONTROLLER ***"
echo "*********Install network tools*********"
sudo yum install net-tools.x86_64 -y
sudo yum install nano -y
echo "*********HOSTNAME CONTROLLER*********"
sudo hostname ansible-controller
echo "*********Connect from ansible-controller to ansible-target*********"
#sudo ssh 172.17.11.5 -y
echo "*********Check IP ADDR*********"
ifconfig