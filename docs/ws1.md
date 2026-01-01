---
title: ""
layout: default
---

## Building the environment for Linux workshops   
### Overview

If you are a Windows user, you will use VirtualBox virtualization software to build a configuration consisting of three computers: a Windows PC, a Debian Linux server virtual machine, and an Alpine Linux desktop virtual machine. I have prepared ready-to-use virtual machines that you only need to download and import to set up the configuration.

If you are a Mac user, you will use UTM virtualization software to build a configuration consisting of two computers: your Mac and a Debian Linux server virtual machine. You will need to perform the Debian installation yourself with the help of my recorded instructions.

Before you start read [this](virtualization.md) to get idea what can be achieved by virtualization.  

### Configuring the server VM 
The recording contains instructions for the activities you need to do in the server after setting up the configuration. They include etc. 
* verify that your server can acces Internet and it can be reached by the host-computer (PC/Mac)
* ensure that the system is up-to-date
* add a personal account using your firstname as the account-name.
* give admin rights to your personal account
* modify the web-server index.html page to contain your account name.
* install workshop test program that you will use to test your
  


### Reporting  
You will report the workshop completion by submitting a picture from a situation where you have connected from your host-computer and Alpine Desktop Linux with browser to web-server application in the Debian server VM, see the [picture](../images/ws1browserconnections.png). If you are a Mac user you don't need to have the Alpine Desktop VM and thus you are allowed to miss the Alpine Desktop browser connection. The picture should contain: 1) browser window from host to Debian VM (Windows/Mac), 2) browser windows from Alpine to Debian server (Wndows users) 3) your host desktop background (Windows/Mac).

> Remember to edit the index.html file in Debian VM's /var/www/html directory, so that the page shows your firstname. 

