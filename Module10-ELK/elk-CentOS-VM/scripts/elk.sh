#!/bin/bash

echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
echo "*******Updates*********"
sudo yum update -y 
echo "*******Install tools*********"
sudo yum install nano -y
sudo yum install wget -y
echo "*******INSTALL LOGSTASH*********"
echo "*******Install Openjdk8 and JRE*********"
sudo yum install java-1.8.0-openjdk java-1.8.0-openjdk-devel -y
echo "*******Download GPG key*********"
sudo rpm --import https://packages.elasticsearch.org/GPG-KEY-elasticsearch
echo "*******Download Logstash Package*********"
sudo wget https://artifacts.elastic.co/downloads/logstash/logstash-7.6.0.rpm > /dev/null 2>&1
echo "*******Install Logstash Package*********"
sudo rpm -ivh logstash-7.6.0.rpm
echo "*******Logstash directory*********"
sudo ls -al /usr/share/logstash

echo "*******INSTALL ELASTICSEARCH*********"
java -version
echo "*******Download GPG key*********"
sudo rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
echo "*******Download Elasticsearch Package*********"
sudo wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.15.0-x86_64.rpm > /dev/null 2>&1
echo "*******Install Elasticsearch Package*********"
sudo rpm --install elasticsearch-7.15.0-x86_64.rpm
echo "*******Activate service at boot*********"
sudo systemctl enable elasticsearch.service
echo "*******Elasticsearch service status*********"
sudo systemctl status elasticsearch.service
echo "*******Elasticsearch directory*********"
sudo ls -al /etc/elasticsearch
#echo "*******Elasticsearch port running?*********"
#sudo curl -X GET 'http://localhost:9200'
#echo "*******Elasticsearch Health*********"
#sudo curl 'localhost:9200/_cat/health?v'


echo "*******INSTALL KIBANA*********"
echo "*******Download Kibana Package*********"
sudo wget https://artifacts.elastic.co/downloads/kibana/kibana-7.15.0-x86_64.rpm > /dev/null 2>&1
echo "*******Install Kibana Package*********"
rpm -ivh kibana-7.15.0-x86_64.rpm
echo "*******Activate service at boot*********"
sudo systemctl enable kibana
echo "*******Kibana service activation*********"
sudo systemctl start kibana
echo "*******Kibana service status*********"
sudo systemctl status kibana

echo "*******INSTALL APACHE SERVER*********"
echo "*******Install httpd*********"
sudo yum install -y httpd 
echo "*******Start httpd server*********"
sudo systemctl start httpd 
echo "*******httpd server status*********"
sudo systemctl status httpd
echo "*******Verify the access log of the Apache server*********"
sudo ls -al /var/log/httpd/

echo "***IP Config***"
sudo yum install net-tools.x86_64 -y > /dev/null 2>&1
ifconfig