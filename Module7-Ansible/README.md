# MODULE 7 ANSIBLE

## Context

Ansible is an open source IT automation engine that automates provisioning, configuration management, application deployment, orchestration, and many other IT processes. It can configure systems, deploy software, and orchestrate more advanced IT tasks such as continuous deployments or zero downtime rolling updates.

Ansible’s main goals are simplicity and ease-of-use. It also has a strong focus on security and reliability, featuring a minimum of moving parts, usage of OpenSSH for transport (with other transports and pull modes as alternatives), and a language that is designed around auditability by humans–even those not familiar with the program.


## Outlines

Part      | Description
----------|-------
Part 1    | Ansible Configuration
Part 2    | Ansible basic command and Playbook
Part 3    | LAMP Deployment with ANsible





## Virtual Machines



Server        | IP Address      |  Vagrant box
--------------|-----------------|---------------
Node1         | 172.17.11.4     | centos/7
Node2         | 172.17.11.5     | centos/7



## Setting



Tools (Node1)             | Versions
--------------------------|-------
Ansible                   | 2.9.25
                          | 




Tools (Node2)             | Versions
--------------------------|-------
                          | 
                          | 


## Issues and troubleshooting

- "No Package kernel-devel-3.10.0-1127.el7.x86_64 available. Error : Nothing to do" : Because of version of Vagrant plugins. Downgrade from Vbguest 0.30/0.29/0.28 to 0.21.
vagrant plugin uninstall vagrant-vbguest
vagrant plugin install vagrant-vbguest --plugin-version 0.21 

- If you have an connection timeout when booting the VM and an error on type "kernel panic not syncing attempted to kill the idle task" on the console, it will be necessary to upgrade the number of CPU on Vagrantfile (Example : From 1 to 2)