This ansible playbook creates a LAMP (Linux-Apache-MySQL-PHP) stack in CentOS 7

Prerequisites:
  1. Passwordless ssh must be correctly set up on all hosts.
  2. Ansible user must have correct privilege on all hosts. 

How to use:
  1. Add the ip addresses of your servers to the hosts file found in this repo to deploy on desired hosts
  2. Run playbook by executing ansible-playbook -v -i hosts main.yml


This playbook contains a sample index.php file that gets pushed to /var/www/html/ for all designated hosts in the hosts file.
If successful navigate to http://ipaddress/ and you should see a test message. 
