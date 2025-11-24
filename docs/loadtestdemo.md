---
title: ""
layout: default
---


# 🐧 Server Load Demonstration

This lab demonstrates how server resource consumption changes under load using **htop**, **iftop** monitoring tools, and **siege** load testing tool.  
We will use a **Debian VM server** running Apache and SSH, and **Alpine Linux Desktop VM or Windows WSL clients** or **Mac terminal** to generate load.

---

## ⚙️ Environment Setup


### Install monitoring tools:
```bash
sudo apt update
sudo apt install htop iftop -y   
```

###  Install siege to alpine  
```bash
sudo apk add siege
```  

or to WSL or Mac 
```bash
sudo apt update
sudo apt install siege -y
```

## Testing and observing   
### Start htop on the server   
ssh to server and start `htop` as a regular user.
have a new ssh session (new tab) to server and run iftop as root: `sudo iftop -enp0s8`    

### Run siege in the client  
siege -c 50 -t 30s http://debian-ip   
> 50 concurrent users   
> 30s → run for 30 seconds  

### Observe  
* In htop, watch CPU and memory usage spike.
* In iftop, observe increased traffic from client → server
* Experiment with different load levels:
  * siege -c 10 -t 20s http://debian-ip/  
  * siege -c 100 -t 30s http://debian-ip/
 
  





