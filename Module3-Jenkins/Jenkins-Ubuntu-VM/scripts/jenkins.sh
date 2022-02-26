#!/bin/bash

echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
echo "Adding apt-keys"
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FCEF32E745F2C3D5
echo "Updating apt-get"
sudo apt-get -y update 
echo "Installing openjdk-jdk"
sudo apt-get install -y openjdk-8-jdk > /dev/null 2>&1
echo "Installing openjdk-jre"
sudo apt-get install -y openjdk-8-jre > /dev/null 2>&1
echo "Installing git"
sudo apt-get -y install git > /dev/null 2>&1
echo "Installing git-ftp"
sudo apt-get -y install git-ftp > /dev/null 2>&1
echo "Installing maven"
sudo apt-get -y install maven > /dev/null 2>&1
echo "Installing jenkins"
sudo apt-get -y install jenkins > /dev/null 2>&1
export JAVA_HOME= /usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
echo "JAVA_HOME"
echo $JAVA_HOME
echo "Starting  Jenkins service"
sudo systemctl start jenkins
echo "Jenkins service status"
sudo systemctl status jenkins
sleep 1m
echo "Installing Jenkins Plugins"
JENKINSPWD=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)
echo $JENKINSPWD
echo "***IP Config***"
sudo apt install net-tools -y
ifconfig
