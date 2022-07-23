#!/bin/bash

# Update CentOS with any patches
echo "Update CentOS with any patches"
yum update -y --exclude=kernel

# Tools
echo "Install Tools"
yum install -y nano git unzip screen wget

# Apache
echo "Install Apache"
sudo yum install -y httpd httpd-devel httpd-tools

sudo chkconfig httpd on
sudo service httpd stop
echo "file modifications"
sudo rm -rf /var/www/html
sudo ln -s /vagrant /var/www/html

sudo service httpd start

# PHP
echo "Install PHP"
sudo yum install -y php php-cli php-common php-devel php-mysql

# MySQL
echo "Install MySQL"
sudo yum install -y mysql mysql-server mysql-devel
sudo wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
sudo yum update -y
sudo yum install -y mysql-server
sudo service mysqld start
sudo mysql -e "SHOW DATABASES";

# Download Starter Content
echo "Install Download content from Gitlab"
echo "The content is already present in the current directory"
cd /vagrant
#sudo -u vagrant wget -q https://gitlab.com/GilbertFongan/vagrant-lamp/-/raw/master/files/index.html
#sudo -u vagrant wget -q https://gitlab.com/GilbertFongan/vagrant-lamp/-/raw/master/files/info.php

sudo service httpd restart
