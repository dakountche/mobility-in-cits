# Introduction
This project emulates a C-ITS and supports Mobile IPv6, NEMO and IPsec.

Other C-ITS services such as CAM and DENM messages can be exchanged between the
Mobile nodes and the Correspondent nodes. These services are not yet implemented in this version of the project. 

This architecture comprises an:

- ITSS-V which acts as a Mobile Router. Thus it advertises a Mobile Prefix in its
Mobile Network. The ITSS-V can move from one ITSS-R to the other. This movement is simulated by modifying the state of the interface from up to down.
- ITSS-R: router which advertises IPv6 prefixes. Two ITSS-Rs are used in this project.
- HA: is the Home Agent of the ITSS-V
- CN: a Correspondent node with which the MNs communicate
- IR: is a node to simulate the Internet. It is present to ease the routing
process

Only the HA and the MR are directly involved in the mobility. The other nodes do not implement the mobility protocols.


# Installation of the environement
This project uses:
 - Git : for version control,
 - Vagrant: to manage the virtual machines,
 - Puppet to provision these VMs,
 - UMIP: to provide the implementation of Mobility management protocols,
 - StrongSwan: to provide for dynamic IPsec support.


## Git
The instruction to install Git are given on:
- https://git-scm.com/doc

This project can be cloned by typing:

```
$ git clone https://github.com/dakountche/mobility-in-cits.git
```
Then you will need to change the directory to mobility-in-cits.


## Vagrant
Vagrant provides the necessary tools to manage virtual machines in a given provider. The provider can be Oracle VirtualBox, VMware, Docker, etc.
VirtualBox is the provider choseen for this project.

The instructions for installing and using  Vagrant are given on :

  - https://www.vagrantup.com/intro/getting-started



After the installation of Vagrant,  the plugin, vagrant-vbguest, needs to be installed to allow Vagrant to manage the  VirtualBox Guest Additions.

In the root directory where the Vagrantfile is (mobility-in-cits), type :

```
$ vagrant plugin install vagrant-vbguest

```


## Puppet

Puppet is used for the provisioning of the virtual machines.



# General manipulation of the VMs

## Starting the VMs
This supposes that Vagrant has been installed...

```
$ vagrant up machineName
```

Where machineName can, for example, be:
 - an empty string: start all the VMs sequentially as they are declared in the Vagrant file
 - ha : start the Home agent


## Conncecting to the VMs
When the machines have been created, you can connect to them by typing:

```
$ vagrant ssh machineName
```

To connect to a specific machine type:
```
vagrant ssh ipsec
```
For example:
```
vagrant ssh ipsec
```

All these commands have to be executed in the directory where the Vagrantfile is.



## Stopping the VMs

The following command will stop all the machines:

```
 $ vagrant halt    
```

To stop a specific machine:

```
$ vagrant halt machineName
```


## Provisioning the VMs
The following command will provision all the VMs:

```
 $ vagrant provision    
```

To provision a specific machine:

```
$ vagrant provision machineName
```


## Destroying the VMs
The overall benefit of Vagrant is that the virtual machines can be destroyed and
created endlessly. Also the provisioning allows the configuration of the machines to be dissociated from the actual VMs.
Therefore, the modifications to the configuration files need to be done outside the VMs and provisioned with Ansible.
However, a modification done inside a VM and which has not been saved will be lost when the VM is destroyed.

The destruction of all the VMS is done by :

```
 $ vagrant destroy
```

To destroy a specific machine: 

```
 $ vagrant destroy machineName 
 ```



