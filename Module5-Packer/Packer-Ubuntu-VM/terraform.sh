apt-get update -y
apt-get install wget -y
apt-get install unzip -y
wget https://releases.hashicorp.com/terraform/1.2.0/terraform_1.2.0_linux_amd64.zip
unzip terraform_1.2.0_linux_amd64.zip
rm -rf terraform_1.2.0_linux_amd64.zip
mv terraform /usr/local/bin/