# MODULE 5 PACKER

## Context

Packer is a free and open source tool for creating golden images for multiple platforms from a single source configuration. 

Packer is an open source tool for creating identical machine images for multiple platforms from a single source configuration. Packer is lightweight, runs on every major operating system, and is highly performant, creating machine images for multiple platforms in parallel. Packer does not replace configuration management like Chef or Puppet. In fact, when building images, Packer is able to use tools like Chef or Puppet to install software onto the image.

A machine image is a single static unit that contains a pre-configured operating system and installed software which is used to quickly create new running machines. Machine image formats change for each platform. Some examples include AMIs for EC2, VMDK/VMX files for VMware, OVF exports for VirtualBox, etc.



## Outlines

Part      | Description
----------|-------
Part 1    | Prepare the environment
Part 2    | Build docker image
Part 3    | Build other image for VirtualBox provider




## Virtual Machines

Server        | IP Address      |  Vagrant box
--------------|-----------------|---------------
Node1         | 172.122.1.25    | bento/ubuntu-20.04





## Setting

- Node1

Tools (Node1)             | Versions
--------------------------|-------
Docker                    | 20.10.8
Packer                    | 1.7.10






## Issues and troubleshooting

- If you have an connection timeout when booting the VM and an error on type "kernel panic not syncing attempted to kill the idle task" on the console, it will be necessary to upgrade the number of CPU on Vagrantfile (Example : From 1 to 2)
