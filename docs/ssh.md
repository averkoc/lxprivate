---
title: ""
layout: default
---

# SSH Key-based Authentication - setup and use  

We use Johnny here as an example user. His account name on local Windows and Linux machines is `johnny`, while on the remote server it is `john`. After completing this page, take some time to get familiar with common [scenarios](ssh_scenarios.md) you may encounter when working with SSH. SSH also supports file transfer through the [SFTP protocol](sftp.md).


## Setup - these commands you issue in your <ins>local computer</ins>

1. Generate public/private keypair using `ssh-keygen` program 
   - Example on Windows  
   ```bat
   C:\Users\johnny>ssh-keygen 
   ```
   - Example in Linux
   ```bash
   johnny@lxlocal:~$ssh-keygen
   ```
   
3. Copy the public-key to the remote server using `ssh-copy-id` script (available on Linux, macOS and Windows WSL)
    - Example on Linux and manOS:
   ```bash 
   johnny@lxlocal:~$ssh-copy-id john@serverdnsname
   ```
   - Example on Windows [(_Use this form to build the command for powershell*_)]({{ "/sshcopyid.html" | relative_url }})  
   ```bat
   C:\Users\johnny>type .ssh\id_ed25519.pub|ssh john@serverdnsname "umask 077;test -d .ssh  || mkdir .ssh;cat >> ~/.ssh/authorized_keys"  
   ```
   

     
> The most common mistake students make in practical exams is running these setup commands on the remote server instead of their local computer.   





   


## Usage  

### Connect to the remote server from local Linux/macOS/WSL
```text
johnny@lxlocal:~$ssh john@serverdnsname
Linux debian 6.1.0-39-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.148-1 (2025-08-26) x86_64
Last login: Wed Oct  1 12:47:08 2025 from 192.168.56.1
john@debian:~$
```

### Or connect to the remote server from local Windows

```text
C:\Users\johnny>ssh john@serverdnsname
Linux debian 6.1.0-39-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.148-1 (2025-08-26) x86_64
Last login: Wed Oct  1 12:47:08 2025 from 192.168.56.1
john@debian:~$
```
---  

## What happens behind the scenes during login
<img width="1143" height="542" alt="image" src="../images/979c2be42ff2.png" />






