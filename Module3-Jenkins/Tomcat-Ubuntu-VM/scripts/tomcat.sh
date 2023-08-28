#!/bin/bash
### Install Tomcat 9 + JRE8 on Ubuntu, Debian, CentOS, OpenSUSE 64Bits
### URL com Screencast de Instalação do Tomcat9
### http://www.linuxpro.com.br/2017/04/instalando-tomcat-9-no-ubuntu/
### Link: https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-8-on-centos-7
## Var definitions
# Check the updated version here -> https://dlcdn.apache.org/tomcat/tomcat-9
TOMCAT_VERSION="9.0.80"


## First install wget
## Primeiro instale o wget

echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
# Check if user has root privileges
if [[ $EUID -ne 0 ]]; then
echo "You must run the script as root or using sudo"
   exit 1
fi

echo "Installing java"


groupadd tomcat && useradd -M -s /bin/nologin -g tomcat -d /usr/local/tomcat tomcat

cd /usr/local/
wget --header 'Cookie: oraclelicense=a' http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jre-8u131-linux-x64.tar.gz > /dev/null 2>&1
tar -xf jre-8u131-linux-x64.tar.gz && rm -f jre-8u131-linux-x64.tar.gz
mv jre1.8.0_131 java

 
echo 'JAVA_HOME=/usr/local/java
export JAVA_HOME
PATH=$PATH:$JAVA_HOME/bin
export PATH' >> /etc/profile
 
source /etc/profile
java -version

echo "Installing tomcat"
 
cd /usr/local/
echo "###Downloading tomcat"
wget --no-check-certificate "https://dlcdn.apache.org/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz" > /dev/null 2>&1
# If get 404 error not found, get new link here (new version tag of tomcat9) https://dlcdn.apache.org/tomcat/tomcat-9/
#(new version tag of tomcat9)
echo "###Extracting archive tomcat"
tar -xvf "apache-tomcat-${TOMCAT_VERSION}.tar.gz"
#(new version tag of tomcat9)
echo "###Moving to tomcat directory"
mv "apache-tomcat-${TOMCAT_VERSION}" tomcat
#(new version tag of tomcat9)
echo "###Deleting downloaded archive"
rm -f "apache-tomcat-${TOMCAT_VERSION}.tar.gz"
echo "###Operations..."
cd /usr/local/tomcat
chgrp -R tomcat conf
chmod g+rwx conf
chmod g+r conf/*
chown -R tomcat webapps/ work/ temp/ logs/
chown -R tomcat:tomcat *
chown -R tomcat:tomcat /usr/local/tomcat



echo '# Systemd unit file for tomcat
[Unit]
Description=Apache Tomcat Web Application Container
After=syslog.target network.target
[Service]
Type=forking
Environment=JAVA_HOME=/usr/local/java
Environment=CATALINA_PID=/usr/local/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/usr/local/tomcat
Environment=CATALINA_BASE=/usr/local/tomcat
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'
ExecStart=/usr/local/tomcat/bin/startup.sh
ExecStop=/bin/kill -15 $MAINPID
User=tomcat
Group=tomcat
[Install]
WantedBy=multi-user.target' > /etc/systemd/system/tomcat.service
 
 
systemctl daemon-reload

echo '
<tomcat-users>
<!--
    Comments
-->
   <role rolename="admin-gui"/>
   <role rolename="manager-gui"/>
   <role rolename="manager-script"/>
   <user username="admin" password="adminpassword" roles="admin-gui,manager-gui,manager-script"/>
</tomcat-users>' > /usr/local/tomcat/conf/tomcat-users.xml

echo '
<Context antiResourceLocking="false" privileged="true" >
<!--
  <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
-->
</Context> '  > /usr/local/tomcat/webapps/manager/META-INF/context.xml

echo '
<Context antiResourceLocking="false" privileged="true" >
<!--
  <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
-->
</Context> '  >  /usr/local/tomcat/webapps/host-manager/META-INF/context.xml

systemctl start tomcat
systemctl enable tomcat

## Open in web browser:
## http://server_IP_address:8080

echo "***IP Config***"
sudo apt install net-tools -y
ifconfig