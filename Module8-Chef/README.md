# MODULE 8 CHEF

## Context

Chef is an automation platform that configures and manages your infrastructure. It transforms the infrastructure into code. It is a Ruby based configuration management tool. This automation platform consists of a Chef workstation, a Chef server and chef clients which are the nodes managed by the Chef server. All the chef configuration files, recipes, cookbooks, templates etc are created and tested on the Chef Workstation and are uploaded to the Chef Server, then it distributes these across every possible nodes registered within the organizations. Not only it gives us complete control but it's super easy to work with.
It groups containers that make up an application into logical units for easy management and discovery.



## Outlines

Part      | Description
----------|-------
Part 1    | Install and configure Chef Workstation
Part 2    | Install and configure Chef Server
Part 3    | Validate connection between Chef Workstation and Chef Server
Part 4    | Build the complete architecture with Chef Node 




## Virtual Machines



Server         | IP Address      |  Vagrant box
---------------|-----------------|---------------
ChefWorstation | 172.25.36.4     | centos/7
ChefServer     | 172.25.36.5     | centos/7
ChefNode       | 172.25.36.6     | centos/7


## Setting


Tools (ChefWorstation)    | Versions
--------------------------|-------
Chefdk                    | 0.14.25-1


Tools (ChefServer)        | Versions
--------------------------|-------
Chef-server-core          | 12.14.0-1
Chef-manage               | 3.0.16-1

Tools (ChefNode)          | Versions
--------------------------|-------
                          | 
                          | 



## Issues and troubleshooting

- If you have an connection timeout when booting the VM and an error on type "kernel panic not syncing attempted to kill the idle task" on the console, it will be necessary to upgrade the number of CPU on Vagrantfile (Example : From 1 to 2)
