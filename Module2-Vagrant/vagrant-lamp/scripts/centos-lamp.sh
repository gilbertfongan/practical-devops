#!/bin/bash

# Update CentOS with any patches
yum update -y --exclude=kernel

# Tools
yum install -y nano git unzip screen wget

# Apache
sudo yum install -y httpd httpd-devel httpd-tools
sudo chkconfig --add httpd
sudo chkconfig httpd on
sudo service httpd stop

sudo rm -rf /var/www/html
sudo ln -s /vagrant /var/www/html

sudo service httpd start

# PHP
sudo yum install -y php php-cli php-common php-devel php-mysql

# MySQL
sudo yum install -y mysql mysql-server mysql-devel
sudo chkconfig --add mysqld
sudo chkconfig mysqld on

sudo service mysqld start

sudo mysql -u root -e "SHOW DATABASES";

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://gitlab.com/GilbertFongan/vagrant-lamp/-/raw/master/files/index.html
sudo -u vagrant wget -q https://gitlab.com/GilbertFongan/vagrant-lamp/-/raw/master/files/info.php

sudo service httpd restart