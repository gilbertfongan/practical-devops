#!/bin/bash

echo "*** ANSIBLE INSTALLATION ***"
echo "*********ANSIBLE PACKAGE WITH YUM*********"
sudo yum install epel-release -y
sudo yum install ansible -y
echo "*********ANSIBLE VERSION*********"
ansible --version
echo "*********Check IP ADDR*********"
ifconfig