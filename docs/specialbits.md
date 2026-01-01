---
title: ""
layout: default
---

## Special permissions   

| Special Bit | Modifies Which x-bit | Applies To  | Effect                                                                 |
|-------------|----------------------|-------------|------------------------------------------------------------------------|
| `setuid`    | User execute (`u+x`) | Executable  | Process runs with the file owner's privileges                          |
| `setgid`    | Group execute (`g+x`)| Directory   | New files inherit the directory’s group                                |
| `sticky`    | Others execute (`o+x`)| Directory  | Only file owner can delete/rename files. Only file owner can modify if strict settings in Kernel (`fs.protected_regular=1`) |


**setuid example**  
```bash
sakari1@debian:~$ ls -l /usr/bin/passwd
-rwsr-xr-x 1 root root 118168 Apr 19  2025 /usr/bin/passwd  

# only root can modify shadow-file that contains password information
sakari1@debian:~$ ls -l /etc/shadow
-rw-r----- 1 root shadow 1505 Nov  7 15:35 /etc/shadow  

# the passwd is run under root (program owner) account due the setuid-bit even though it is started by regular user
sakari1@debian:~$ passwd sakari1
# rows omitted to save space
passwd: password updated successfully  

# Here you see that the shadow-file modification succeeded
sakari1@debian:~$ ls -l /etc/shadow
-rw-r----- 1 root shadow 1505 Nov  7 17:12 /etc/shadow
sakari1@debian:~$
````

[Setgid-bit and sticky-bit for directories](shareddirectory.md) 
```bash
sakari@debian:~$ ls -l /var/examples/
total 12
drwxrwxr-x 2 root team1 4096 Nov  7 15:36 team1files
drwxrwsr-x 2 root team2 4096 Nov  7 15:36 team2files
drwxrwsr-t 2 root team3 4096 Nov  7 16:30 team3files
sakari@debian:~$
````

