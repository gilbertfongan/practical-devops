# MODULE 10  ELK

## Context

ELK Stack is a collection of three open-source products Elasticsearch, Logstash, and Kibana, all developed, managed and maintained by Elastic. Elasticsearch is an open source, full-text search and analysis engine, based on the Apache Lucene search engine. Logstash is a log aggregator that collects data from various input sources, executes different transformations and enhancements and then ships the data to various supported output destinations. Kibana is a visualization layer that works on top of Elasticsearch, providing users with the ability to analyze and visualize the data. Together, these different components are most commonly used for monitoring, troubleshooting and securing IT environments (though there are many more use cases for the ELK Stack such as business intelligence and web analytics). 


## Outlines

Part      | Description
----------|-------
Part 1    | Environment setup
Part 2    | Getting started with Logstash
Part 3    | Getting started with Elasticsearch
Part 4    | Getting started with Kibana
Part 5    | Configure Kibana with Logstash and Elasticsearch






## Virtual Machines



Server                     | IP Address      |  Vagrant box
---------------------------|-----------------|---------------
Node1 (elk-machine)        | 192.168.12.11   |  centos/7




## Setting


Tools (Node1)             | Versions
--------------------------|-------
Openjdk                   | 1.8.0
Logstash                  | 7.6.0
Elasticsearch             | 7.15.0
Kibana                    | 7.15.0








## Issues and troubleshooting

- If you have an connection timeout when booting the VM and an error on type "kernel panic not syncing attempted to kill the idle task" on the console, it will be necessary to upgrade the number of CPU on Vagrantfile (Example : From 1 to 2)
