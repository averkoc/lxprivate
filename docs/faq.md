---
title: ""
layout: default
---

# Linux Essentials — Frequently Asked Questions

### Q1. After installing Debian Server from ISO-file, I can’t use sudo   

> This is related only to students who installed debian from installation media. The ready-made VMs (*.ova files) have already sudo installed and account sudo added to group sudo.

Short answer: Log in as root, install sudo, add account student to the sudo group, then re-login with sudo account.

Steps:
1. Log in as root using the debian console window.
2. Install sudo:
   ```bash
   root@debian:~#apt update
   root@debian:~#apt install sudo
   ```
3. Add your account student to the sudo group:
   ```bash
   # still logged in as root
   root@debian:~#usermod -aG sudo student
      ```
4. Log out from the root-session. When you now log in as user student, your new group membership in group sudo is in effect and you can issue administrative commands using sudo when needed.
```bash
# In place of debian.local you can alternatively use the debian server's IP-address
C:\Users\sakke>ssh student@debian.local  # people with mac issue the same command using mac-terminal
# Many rows omitted here - just information sent from server
student@debian.local's password:
student@debian:~$
# Now you are able to use sudo when you need to do administrative tasks.  
```

### Q2. How to add a new regular user account

Short answer: Log in as student, issue command `sudo adduser` and follow the prompts to set password and optional details.  
```bash
student@debian:~$ sudo adduser alex
[sudo] password for student:
Adding user `alex' ...
Adding new group `alex' (1013) ...
Adding new user `alex' (1013) with group `alex (1013)' ...
Creating home directory `/home/alex' ...
Copying files from `/etc/skel' ...
New password:
... etc
```

### Q3. How to add sudo rigths to your firstname account  

Follow these steps:

1. Log in as the `student` user (if your student account doesn't yet have sudo rights, follow the instructions in Q1)  
   
2. Add your firstname account to the `sudo` group  
   Run the following command, replacing `firstname` with your actual username:  
   ```bash
   sudo usermod -aG sudo firstname
   ````
 
3. Log out of the student account

4. Log in with your firstname account  
Your account now belongs to the sudo group and can use the sudo command.

### Q4. I changed my firstname password but can't change it back to my original password

If your original password (your firstname) is very short, the `passwd` program will not allow you to set it again when you run the command as a regular user. Even though `passwd` always runs with root permissions internally, it still checks which user started the command. If it is started by a normal user, it enforces the system’s password rules and will reject simple or short passwords.

However, when the `passwd` command is executed *by root* (using `sudo`), these checks are bypassed and the password can be set without restrictions.

To bypass the password rules, use:

```bash  
sudo passwd firstname
````

### Q5. My keyboard layout is not recognized in Debian console

Look [this](https://averkoc.github.io/lx/server_keyboard/) for instructions.  
> This is not related to ssh-sessions 
