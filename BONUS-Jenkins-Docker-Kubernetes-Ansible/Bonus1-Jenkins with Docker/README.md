# BONUS 1 JENKINS-DOCKER

## Context

Jenkins is an open source automation server which enables developers around the world to reliably build, test, and deploy their software.

It helps automate the build, test and deployment parts of software development, and facilitates continuous integration and continuous delivery. Written in Java, Jenkins runs in a servlet container such as Apache Tomcat, or in standalone mode with its own embedded web server. 
Docker is a platform for running certain applications in software containers. 

Docker allows you to embed an application in one or more software containers that can run on any machine server, whether physical or virtual. Docker works on Linux as well as Windows Server. It is a technology that aims to facilitate the deployment of applications and the management of the underlying infrastructure.



## Outlines

Part      | Description
----------|-------
Part 1    | Prepare the environment
Part 2    | Configuring Jenkins and plugins
Part 3    | Run CI/CD pipeline to build Docker image and deploy on Docker Swarm


## Virtual Machines

Server                          | IP Address      |  Vagrant box
--------------------------------|-----------------|---------------
Jenkins-Docker (Master Node)    | 10.0.0.150      | bento/ubuntu-20.04
Jenkins-Docker (Worker Node)    | 10.0.0.151      | bento/ubuntu-20.04


## Setting

- Jenkins-Docker

Tools (Master Node)       | Versions
--------------------------|-------
Jenkins                   | 2.340
Docker                    | 20.10.14
Openjdk                   | 8

- Jenkins-Docker

Tools (Worker Node)       | Versions
--------------------------|-------
Docker                    | 20.10.14
Openjdk                   | 8


## Issues and troubleshooting

- Run first "# vagrant up --provision" with [shell.path = "scripts/docker.sh"] commented in vagrantfile to install only Jenkins, then uncomment the same line and run "# vagrant reload --provision" to install Docker : When having error on booting VM

- When running the pipeline, if you have a matching response below (Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/json": dial unix /var/run/docker.sock: connect: permission denied), please enter the command below (sudo usermod -a -G docker jenkins) to allow the jenkins user to run the docker commands in sudo mode.
