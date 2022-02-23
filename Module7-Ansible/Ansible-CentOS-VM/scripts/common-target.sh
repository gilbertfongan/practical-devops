#!/bin/bash
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
echo "*** COMMON INSTALLATION-TARGET ***"
echo "*********Install  tools*********"
sudo yum install net-tools.x86_64 -y
sudo yum install nano -y
echo "*********HOSTNAME TARGET*********"
sudo hostname ansible-target
echo "*********CONFIGURE SSHD: Uncomment PasswordAuthentication Yes*********"
#sed -i 's/search_string/replace_string/' filename
#sudo sed -i '/PasswordAuthentication/s/^#//g' /etc/ssh/sshd_config
echo "*********Restart the SSHd service*********"
#sudo systemctl restart sshd
echo "*********Check IP ADDR*********"
ifconfig