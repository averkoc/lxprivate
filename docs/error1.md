---
title: ""
layout: default
--- 


### Failure to configure keybased authentication correctly 

The most common error is generating the key pair on the wrong computer. To avoid this, **you must carefully check the prompt** to ensure that you run the ssh-keygen and ssh-copy-id commands on your local system.

Assume that you are the user john and you want to set up key-based authentication for logging in to a server whose DNS name is remoteserver.example.com. Your instructor has created the account johnsr for you on that server. To configure key-based authentication for passwordless login, you may use any of the following local environments: `Windows CMD`, `Windows WSL`, `macOS Terminal`, `Alpine Linux`, or even a `Debian virtual machine`. **The critical requirement is to check the prompt** so that you always know which computer you are issuing commands on.  

 **Correct procedure:**
 
 <img width="1540" height="476" alt="image" src="images/e2728e6f19d7.png" />


[Keybased authentication configuration](ssh.md) 

### About the prompts 

In Linux, the shell prompt is typically shown as `user@hostname:~$ `. Administrators often set the hostname to the first part of the domain name. For example, on our example the **remote prompt** might appear as **`johnsr@remoteserver:~$ `**.  NOT e.g `johnsr@remoteserver.example.com:~$ ` which would be informative but with long DNS-names it would occupy too much space.

The **local prompt**, depending on the environment and the user account that John is using, could be, for example, one of the following: `C:\Users\john>`, `alpine:~$`, `john@mywsl`, `john@debian`, `student@debian`, `john@MacBook-Pro ~ %`.

