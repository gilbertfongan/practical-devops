# MODULE 2 VAGRANT

## Context

Vagrant is a tool for creating virtual machines during the development of your application in order to achieve the desired environment without changing the configuration of your machine.
Vagrant is a tool for building and managing virtual machine environments in a single workflow. With an easy-to-use workflow and focus on automation, Vagrant lowers development environment setup time, increases production parity, and makes the "works on my machine" excuse a relic of the past.

Why Vagrant?

Vagrant provides easy to configure, reproducible, and portable work environments built on top of industry-standard technology and controlled by a single consistent workflow to help maximize the productivity and flexibility of you and your team.

To achieve its magic, Vagrant stands on the shoulders of giants. Machines are provisioned on top of VirtualBox, VMware, AWS, or any other provider. Then, industry-standard provisioning tools such as shell scripts, Chef, or Puppet, can automatically install and configure software on the virtual machine.



## Outlines

Part      | Description
----------|-------
Part 1    | Download and Install Vagrant and VirtualBox
Part 2    | Vagrant basic command
Part 3    | Vagrant plugins
Part 4    | Vagrant provision (Manual Provision)
Part 5    | Vagrant provision (Shell/file Provision)
Part 6    | LAMP stack (Automatic Provision)



## Setting

All the following tools have been installed on a Windows 10 system.

Tools                     | Versions
--------------------------|-------
Visual Studio Code        | 1.64.2
Git Bash                  | 2.35.1
Vagrant                   | 2.2.18


## Issues and troubleshooting

- "vagrant@127.0.0.1: Permission denied (publickey)" : when 
trying "vagrant ssh" command, you can this command to correct it "set VAGRANT_PREFER_SYSTEM_BIN=0".
