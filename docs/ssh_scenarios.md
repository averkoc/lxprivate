---
title: ""
layout: default
---


# SSH-Session Scenarios: A Novice Guide 🚀

This guide covers the most common events and error messages you may encounter during SSH connection attempts and how to resolve them. I use in this guide our local Debian VM server as an example "remote server". 

## Your first connection to a server  

When connecting to a server for the first time, your SSH client doesn't recognize the server's unique identifier (its host key fingerprint). This prompt is a standard security measure to confirm the identity of the remote host and to store its unique key locally.

````bash
alpine:~$ ssh student@debian.local
The authenticity of host 'debian (192.168.1.7)' can't be established.
ED25519 key fingerprint is SHA256:WLMyeSME9J6w0eeYBrvFzKCTVxX5DQWnQdquu13JnSY.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
````
#### Resolution  
- Type yes and press Enter.
- The server's host key will be saved to your ~/.ssh/known_hosts file.
- Future connections to this server will proceed immediately without this prompt.

Note: This is normal and expected for a first-time connection, and it also appears when using ssh-copy-id without a prior successful connection 


## Permission denied (publickey)  
This error occurs when the remote server is configured for high security and only allows key-based authentication. The server checked for your authorized public key but couldn't find it, typically because you haven't copied it yet

````bash
alpine:~$ ssh student@debian.local
student@debian: Permission denied (publickey).
alpine:~$
````
#### Resolution

- Use ssh-copy-id: This is the easiest way to transfer your key. Run the command, which will prompt you for your server password (if temporarily enabled) to complete the key transfer:
```bash
ssh-copy-id student@debian.local
```
- if you have not even generated the key-pair then you must do it first

## Warning: Remote Host Identification Has Changed! 🚨 
This is the most critical warning. It means the server's unique identifier (its host key) has changed from the one you previously saved in your ~/.ssh/known_hosts file. Your SSH client automatically blocks the connection, fearing a potential security risk.  
**Common causes:** 
- The server was reinstalled, updated, or its IP/hostname changed (common in training environments).
- A Man-in-the-Middle (MITM) attack is taking place (a major concern in production environments)

````bash
alpine:~$ ssh student@debian.local
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ED25519 key sent by the remote host is
SHA256:GpJD/4nZBWlkigp6OGlhicF420ChcL7SQVo7heUFc8U.
Please contact your system administrator.
Add correct host key in /home/student/.ssh/known_hosts to get rid of this message.
Offending ED25519 key in /home/student/.ssh/known_hosts:1
Host key for debian has changed and you have requested strict checking.
Host key verification failed.
alpine:~$
````
#### Resolution  

- If you have verified the change is legitimate (e.g., confirmed with your instructor or administrator), you must remove the old, mismatched key entry by hostname (or ip)  
  - **On Linux/Mac/WSL**
  ```bash
    ssh-keygen -R debian.local
  ```
  - **On Windows (Manually)**  
  Open the \.ssh\known_hosts file in a text editor and delete the entire line that contains the entry for the server (debian). The error message often provides the line number

After removing the old key, try connecting again. You will receive the "First Connection" prompt (Scenario 1) and can safely type yes to store the new, correct key.

> Heavy-handed way to resolve the problem:  If you cannot find the correct line or the `ssh-keygen -R` command fails, you can delete the entire known_hosts file.  
> **WARNING: This will clear the saved keys for every server you have ever connected to**, and you will receive the "First Connection" prompt the next time you connect to any of them.  

## ssh-copy-id fails due to regexp error
If the Linux server .ssh/authorized_keys contains e.g. \r\n (windows CR, LF) that causes ssh-copy-id fail. The root cause is typical an erroneous key copying from windows to server that inserts CR,LD at the end of public key.

#### Resolution
# On the remote server
* Remove the illegal CR character from the authorized_keys file  
`sed -i 's/\r$//' ~/.ssh/authorized_keys`
* Remove the root cause by instructing users to fix their public-key copying solution

