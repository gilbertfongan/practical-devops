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


## Getting started



After booting the machine, you can check if the Jenkins service is running (There has been an automatic provisioning of Docker and Jenkins via Vagrant at startup)

![Jenkins-service-status](/uploads/dc7d3e7259bb8b0a502e02cc92350cdd/Jenkins-service-status.png)

Now you can proceed to the Jenkins configuration by retrieving the "InitialAdminPassword" parameter at startup
![2-read-initial-admin-pass](/uploads/9e4b8d3f77a28668f61f36355e5e236b/2-read-initial-admin-pass.png)

Then, fill it in

![Config-jenkins-page](/uploads/149cc622ad314e333e0fab51a4b904d0/Config-jenkins-page.png)

Installation running

![4-Jenkins-Installation-running](/uploads/4f84fdcebc8c9c24f27c7704ffc1606a/4-Jenkins-Installation-running.png)


Creation of the first administrator user (http://172.10.10.10:8080/)

![5-Jenkins-first-admin-user](/uploads/d1959be41024fec94ccb64112bf5ffa7/5-Jenkins-first-admin-user.png)

Jenkins Dashboard

![6-jenkins-dashboard](/uploads/37d3abc36bb5948b6ca1a46c78b243c2/6-jenkins-dashboard.png)

### Create Docker Swarm

Go to "new item" and create the first job

![7-create-first-job](/uploads/d35b3e6a3db804d8e9c8948def98f4db/7-create-first-job.png)

Configure the job with these parameters (Already filled on Jenkinsfile) : 

- DOCKER_MANAGER (default value : 10.0.0.150), type : String

- ACTION_CLUSTER(values : InitCluster, LeaveCluster), type : choice

![8-Jenkins-add-parameter](/uploads/4dbeb40d44680335a8aa61e2abe471b8/8-Jenkins-add-parameter.png)

Pipeline Definition -> "Pipeline script from SCM" :
Repository URL = https://gitlab.com/GilbertFongan/devops-book-labs.git
Script Path = BONUS-Jenkins-Docker-Kubernetes-Ansible/Bonus1-Jenkins with Docker/Jenkins-Docker-VM2/deploy/create-docker-swarm-cluster/jenkinsfile

![9-Jenkins-pipeline-scm](/uploads/06eac2d89e27f719caf7cc3534a6b84a/9-Jenkins-pipeline-scm.png)

And Save the configuration...


First Build

Being on the pipeline, you can launch the first build through the "launch a build with parameters" option

![10-Jenkins-pipeline-ready](/uploads/f015bfc34899c9281c87caf9d372402b/10-Jenkins-pipeline-ready.png)

Fill in the desired parameters

![11-Jenkins-build-ready-and-filled](/uploads/7a984d2c9fd8f18f02ce20b9176edc86/11-Jenkins-build-ready-and-filled.png)

Then Build to create the Docker Swarm Cluster : Go the output of current build, then clikc on "Console Output" (for this example my current build is number 12)

![12-Jenkins-success-build](/uploads/79c3a3d501b3ffa8a5ace010ffc7f669/12-Jenkins-success-build.png)

The Docker Swarm is activated and you have only one active Node (node1)


### Deploy to Docker Swarm

Go to "new item" and create the second job

![13-Jenkins-deploy-job-creation](/uploads/a79e114c562339e35741b582a89f4981/13-Jenkins-deploy-job-creation.png)

Configure the job with these parameters (Already filled on Jenkinsfile) : 

- GIT_REPOS_DOCKER_FILE (default value : app2), type : String
- SERVICE_NAME (default value : test), type : String
- PUBLISHED_PORT (default value : 8081), type : Number
- TARGET_PORT (default value : 80), type : Number
- DOCKER_IMAGE (default value : gilbertfongan/demo:v1), type : String
- NETWORK_NAME (default value : app-net), type : String
- REPLICAS_NUMBER (default value : 2), type : Number
- TYPE_DEPLOY (values : NewDeploy Service, Update Service, Delete Service ), type : choice
- PUSH_DOCKER_HUB (default value: false), type : Boolean



Pipeline Definition -> "Pipeline script from SCM" :
Repository URL = https://gitlab.com/GilbertFongan/devops-book-labs.git
Script Path = BONUS-Jenkins-Docker-Kubernetes-Ansible/Bonus1-Jenkins with Docker/Jenkins-Docker-VM2/deploy/deploy-to-docker-swarm/jenkinsfile

![14-Jenkins-git-scm-deploy-on-swarm-config](/uploads/60566e7ca6147d67b55de7c4341228d6/14-Jenkins-git-scm-deploy-on-swarm-config.png)

And Save the configuration...

Second Build

Being on the pipeline, you can launch the first build through the "launch a build with parameters" option

![15-jenkins-pipeline-ready-deploy-to-swarm](/uploads/6e7d7ef36909a83f3286f206d64a9866/15-jenkins-pipeline-ready-deploy-to-swarm.png)

Fill in the desired parameters

Then Build to deploy an Application on the Docker Swarm Cluster : Go the output of current build, then clikc on "Console Output" (for this example my current build is number 11)

![16-jenkins-deploy-to-swarm-success](/uploads/4830191724162e73d577170eec6e86ab/16-jenkins-deploy-to-swarm-success.png)