# MODULE 3 JENKINS

## Context

Jenkins is an open source automation server which enables developers around the world to reliably build, test, and deploy their software.

It helps automate the build, test and deployment parts of software development, and facilitates continuous integration and continuous delivery. Written in Java, Jenkins runs in a servlet container such as Apache Tomcat, or in standalone mode with its own embedded web server. 



## Outlines

Part      | Description
----------|-------
Part 1    | Prepare the environment
Part 2    | Configuring Jenkins and initial job
Part 3    | Jenkins integration with Git
Part 4    | Deployment with Tomcat
Part 5    | Complete CI/CD with Jenkins Declarative Pipeline


## Virtual Machines

Server        | IP Address      |  Vagrant box
--------------|-----------------|---------------
Jenkins       | 172.17.8.163    | bento/ubuntu-20.04
Tomcat        | 172.17.8.164    | bento/ubuntu-20.04


## Setting

- Jenkins node

Tools (Jenkins)           | Versions
--------------------------|-------
Jenkins                   | 2.336
Git                       | 2.25.1
Openjdk                   | 8

- Tomcat node

Tools (Tomcat)            | Versions
--------------------------|-------
Tomcat                    | 9.0.58
Openjre                   | 8.131


## Issues and troubleshooting

- Tomcat Version : 404 Not Found (Update Tomcat version link)
