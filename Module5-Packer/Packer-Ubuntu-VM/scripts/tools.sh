#!/bin/bash
#echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
echo "*******Updates*********"
sudo apt-get update -y 
echo "*******Create first_image directory under /home/vagrant*********"
sudo mkdir first_image
echo "*******Copy project files to /home/vagrant*********"
cp -R /vagrant/docker-ubuntu.pkr.hcl /home/vagrant/first_image
echo "*******Create second_image directory under /home/vagrant*********"
sudo mkdir second_image
echo "*******Copy project files to /home/vagrant*********"
cp -R /vagrant/docker-terraform.json /home/vagrant/second_image
cp -R /vagrant/terraform.sh /home/vagrant/second_image
cp -R /vagrant/awscli.sh /home/vagrant/second_image
echo "*** INSTALL DOCKER ***"
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
echo "*** INSTALL PACKER ***"
echo "*** Add HashiCorp GPG Key ***"
sudo curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
echo "*** Add HashiCorp Linux repository ***"
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
echo "***Updates, Install Packer & Packer Version***"
sudo apt-get update -y && sudo apt-get install packer -y
echo "***Packer Version***"
packer --version
echo "***IP Config***"
sudo apt install net-tools -y
ifconfig