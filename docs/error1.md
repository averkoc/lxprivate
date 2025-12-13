---
title: ""
layout: default
--- 


### Failure to configure keybased authentication correctly 

The most common error is generating the key pair on the wrong computer. To avoid this, **you must carefully check the prompt** to ensure that you run the ssh-keygen and ssh-copy-id commands on your local system.

Assume that you are the user john and you want to set up key-based authentication for logging in to a server whose DNS name is remoteserver.example.com. Your instructor has created the account johnsr for you on that server. To configure key-based authentication for passwordless login, you may use any of the following local environments: `Windows CMD`, `Windows WSL`, `macOS Terminal`, `Alpine Linux`, or even a `Debian virtual machine`. **The critical requirement is to check the prompt** so that you always know which computer you are issuing commands on.  

 **Correct procedure:**
 
 <img width="1540" height="476" alt="image" src="https://github.com/user-attachments/assets/8ef7c456-aa66-43ef-b380-36bb8207b7ec" />


[Keybased authentication configuration](ssh.md) 


