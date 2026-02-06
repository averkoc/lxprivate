---
title: ""
layout: default
---

## Testing your workshop (pilot)

The workshops are supported by complete recorded video instructions and accompanying GitHub support pages, which together contain also the model reports (screenshots).
As additional support, I have created a test program to help you identify potential issues before submitting your report. This provides immediate feedback and
allows you to correct problems while the workshop is still fresh in your memory. 

### How to get started with the test program  

All the steps below and after assume that you are logged in to your debian with your firstname account.  

* Dowload the `lxcheck` test program to your debian home directory
```bash
wget https://averkoc.github.io/lx/assets/lxcheck
```
* Move the downloaded test program to /usr/local/bin and make it executable
```bash
sudo mv ~/lxcheck /usr/local/bin
sudo chmod +x /usr/local/bin/lxcheck
```

### Test your workshop
Currently there are tests for workshop 5 (Logging) and workshop 6 (Special bits).   

```bash
# test your workshop 5
sudo lxcheck ws5.enc

# test your workshop 6
sudo lxcheck ws6.enc

````
--- 

### Example usage

John tests his workshop5  

```bash
john@dbn:~$ sudo lxcheck ws5.enc
Using logged-in user account: john
Running preparation commands...

Running checks for workshop: Logging
Student account: john
============================================================
✓ PASS | john is member of sudo group (user_groups)
       Check passed
✓ PASS | User edited 000-default.conf (file)
       Check passed
✓ PASS | Document Root warning found in error log (file)
       Check passed
✓ PASS | Page not found error logged in access log (file)
       Check passed
============================================================
Results: 4/4 checks passed
✓ Results submitted successfully
john@dbn:~$
```
John tests his workshop6  
```bash
john@dbn:~$ sudo lxcheck ws6.enc
Using logged-in user account: john

Running checks for workshop: WS6 Special bits
Student account: john
============================================================
✓ PASS | workshop user accounts exist (user)
       Check passed
✓ PASS | team1,team2,team3 groups exist (group)
       Check passed
✓ PASS | john1 in team1 (user_groups)
       Check passed
✓ PASS | john2 in team1 (user_groups)
       Check passed
✓ PASS | john3 in team2 (user_groups)
       Check passed
✓ PASS | john4 in team2 and team3 (user_groups)
       Check passed
✓ PASS | john5 in team2 and team3 (user_groups)
       Check passed
✓ PASS | john6 in team2 and team3 (user_groups)
       Check passed
✓ PASS | team1 directory (directory)
       Check passed
✓ PASS | team2 directory with SGID (directory)
       Check passed
✓ PASS | team3 directory with SGID and STICKY bit (directory)
       Check passed
✓ PASS | john1 files in team1files directory (file)
       Check passed
✓ PASS | john4 files in team2files directory (file)
       Check passed
✓ PASS | john4 files in team3files directory (file)
       Check passed
============================================================
Results: 14/14 checks passed
✓ Results submitted successfully
john@dbn:~$
```

 









---

e66585a9e9b09ace4a5366295c5edcf38d9974f22bcbe8557576adafc383d655
