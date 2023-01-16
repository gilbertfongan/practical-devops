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
Part 2    | Create Docker Swarm with Jenkins pipeline
Part 3    | Deploy image on Docker Swarm with Jenkins pipeline


## Virtual Machines

Server                          | IP Address      |  Vagrant box
--------------------------------|-----------------|---------------
Jenkins-Docker (Master Node)    | 172.10.10.10    | bento/ubuntu-20.04
Jenkins-Docker (Worker Node)    | 172.10.10.11    | bento/ubuntu-20.04


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

- If you have an connection timeout when booting the VM and an error on type "kernel panic not syncing attempted to kill the idle task" on the console, it will be necessary to upgrade the number of CPU on Vagrantfile (Example : From 1 to 2)


## Tests

After booting the machine, you can check if the Jenkins service is running (There has been an automatic provisioning of Docker and Jenkins via Vagrant at startup)

![Jenkins-service-status](/uploads/dc7d3e7259bb8b0a502e02cc92350cdd/Jenkins-service-status.png)

Now you can proceed to the Jenkins configuration by retrieving the "InitialAdminPassword" parameter at startup
![2-read-initial-admin-pass](/uploads/9e4b8d3f77a28668f61f36355e5e236b/2-read-initial-admin-pass.png)

Then, fill it in

![Config-jenkins-page](/uploads/149cc622ad314e333e0fab51a4b904d0/Config-jenkins-page.png)

Installation running

![4-Jenkins-Installation-running](/uploads/4f84fdcebc8c9c24f27c7704ffc1606a/4-Jenkins-Installation-running.png)


Creation of the first administrator user

![5-Jenkins-first-admin-user](/uploads/d1959be41024fec94ccb64112bf5ffa7/5-Jenkins-first-admin-user.png)