# MODULE 9  PROMETHEUS & NODE EXPORTER & GRAFANA

## Context

Prometheus is open source computer monitoring and alerting software. It logs real-time metrics to a time series database based on entry point content exposed using the HTTP protocol. Grafana is free software that enables data visualization. It allows you to create dashboards and graphs from several sources including temporal databases such as Graphite, InfluxDB and Prometheus. 


## Outlines

Part      | Description
----------|-------
Part 1    | Install and configure Node Exporter
Part 2    | Install and configure Prometheus
Part 3    | Install and configure Grafana





## Virtual Machines



Server                     | IP Address      |  Vagrant box
---------------------------|-----------------|---------------
Node1 (Prometheus&Grafana) | 172.25.36.4     |  bento/ubuntu-20.04
Node2 (Node Exporter)      | 172.25.36.5     |  bento/ubuntu-20.04



## Setting


Tools (Node1)             | Versions
--------------------------|-------
Prometheus                | 2.2.1
Node Exporter             | 1.0.1
Grafana                   | 5.0.4

Tools (Node2)             | Versions
--------------------------|-------
Node Exporter             | 1.0.1






## Issues and troubleshooting

- If you have an connection timeout when booting the VM and an error on type "kernel panic not syncing attempted to kill the idle task" on the console, it will be necessary to upgrade the number of CPU on Vagrantfile (Example : From 1 to 2)
