---
title: ""
layout: default
---


### Virtual Machines

Virtualization software makes it possible to create many virtual computers in one physical computer and install a distinct operating system to each virtual machine. This kind of software is called a hypervisor. Two types of hypervisors exist:  
* Type one hypervisor software runs directly on the physical computer (bare metal) and virtual computers are created using it.  
* Type two hypervisor is installed upon the host operating system. Compared to type one hypervisor type two leaves less resources to create virtual computers (called guests).  

Virtualization is widely used in data centers. The isolation between virtual machines protects different systems and customers from each other. It also helps one make better use of the hardware resources because one customer's load may be too low to take advantage of the server's HW-resources.

Virtual machines are also very useful to software developers and IT staff. They can test different configurations without multiplying hardware. A ready-made virtual machine can then be copied to a different place - e.g., from local premises to a cloud platform.

In teaching we use these VM's e.g., to demonstrate virtualization, Linux based operating systems, networking topics, server and client applications and security.

### Example configuration - How it looks in practice  
In the picture below, you can see that I have three independent computers on my Windows PC, each with its own IP address.    

![Example](../images/ws1ips.png)

