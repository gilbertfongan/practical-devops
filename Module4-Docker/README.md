# MODULE 4 DOCKER

## Context

Docker is a platform for running certain applications in software containers. 

Docker allows you to embed an application in one or more software containers that can run on any machine server, whether physical or virtual. Docker works on Linux as well as Windows Server. It is a technology that aims to facilitate the deployment of applications and the management of the underlying infrastructure.



## Outlines

Part      | Description
----------|-------
Part 1    | Prepare the environment
Part 2    | Application deployment without Dockerfile
Part 3    | Application deployment with Dockerfile
Part 4    | Docker Compose
Part 5    | Docker Swarm
Part 6    | Docker Stack



## Virtual Machines

Server        | IP Address      |  Vagrant box
--------------|-----------------|---------------
Node1         | 172.17.8.104    | bento/ubuntu-20.04
Node2         | 172.17.8.105    | bento/ubuntu-20.04




## Setting

- Node1

Tools (Node1)             | Versions
--------------------------|-------
Docker                    | 20.10.8
Docker Compose            | 1.29.2


- Node2

Tools (Node2)             | Versions
--------------------------|-------
Docker                    | 20.10.8



## Issues and troubleshooting

- If you have an connection timeout when booting the VM and an error on type "kernel panic not syncing attempted to kill the idle task" on the console, it will be necessary to upgrade the number of CPU on Vagrantfile (Example : From 1 to 2)
