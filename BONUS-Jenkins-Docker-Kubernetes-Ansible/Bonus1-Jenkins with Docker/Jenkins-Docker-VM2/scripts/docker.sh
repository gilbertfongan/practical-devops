#!/bin/bash
#echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
echo "*** INSTALL DOCKER ***"
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
echo "***Docker Version***"
sudo docker --version
echo "*** INSTALL DOCKER COMPOSE ***"
echo "***Download the current stable release of Docker Compose***"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
echo "***Apply executable permissions***"
sudo chmod +x /usr/local/bin/docker-compose
echo "***Create a symbolic link to /usr/bin***"
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
echo "***Docker Compose Version***"
sudo docker-compose -version
echo "***ADD JENKINS TO DOCKER GROUP***"
sudo usermod -a -G docker jenkins
echo "***Force to execute Docker Command without sudo ***"
sudo chmod 666 /var/run/docker.sock
echo "***Restart Docker Service***"
sudo systemctl restart docker
echo "***IP Config***"
sudo apt install net-tools -y
ifconfig

