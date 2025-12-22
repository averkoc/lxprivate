---
title: ""
layout: default
---

## Linux Workshop: Users, Groups, and File Permissions

## Overview
In this workshop, you will set up a shared directory that can be accessed by members of a specific group. Only group members will be able to create files in this directory, and access to each file will depend on the permissions set by its owner—allowing other group members to either read or modify the file.

The workshop begins with creating new user accounts on the server, followed by setting up a group named **labgroup1** and assigning selected users to it. Next, you will create a shared folder on the server and configure it so that it is write accessible only to members of **labgroup1**.

Finally, you will create and test files in the shared directory to observe how different permission settings affect collaboration within the group. 

---

## Learning Outcomes
By the end of this workshop, you will be able to:

- Create and manage user accounts on a Linux server.  
- Form groups and configure shared directories with appropriate permissions.  
- Experiment with file-level permissions to understand their impact on collaboration.  
- Recognize how manual user and group management becomes inefficient at scale, and why automation is essential in larger environments such as educational institutes or organizations.  

---

## Tasks 

> **Note: instead of matti1,matti2,... use your own firstname1,firstname2,... accounts.**

### 1. Create User Accounts
- Log in to the server via SSH.  
- Create at least **five new users** (e.g., `matti1`, `matti2`, `matti3`, `matti4`, `matti5`).  
- Verify that the users have been added correctly.  

### 2. Create and Manage a Group
- Create a new group called **labgroup1**.  
- Add a subset of the new users (e.g., `matti1`, `matti2`, `matti3`) to this group.  
- Verify the group membership with the `groups` command.  

### 3. Create a Shared Directory
- Create a directory **/var/labs** and and directory **group1files** under it.  
- Set the group ownership of group1files to **labgroup1**.  
- Configure directory permissions so that only members of **labgroup1** can create files inside it.  

### 4. Test File Permissions  
You do all the steps below as user matti1 (your firstname1) - **you don't need sudo command and you shouldn't use it**.
- Log in as matti1 and create three files: matti1filea,matti1fileb,matti1filec. All files must have same group value (group ownership).
- Set the files ownerships and permissions in such a way that they are along the permissions presented in the table below.
- Verify your settings by logging in as matti2/matti3 and matti4/matti5 and observing the effect of permissions.
- **Report your results by submitting the output of command:** `ls -lR /var/labs`

| filename     | matti1 | matti2 | matti3 | matti4 | matti5 |
|--------------|--------|--------|--------|--------|--------|
| matti1filea  | rw     | r      | r      | r      | r      |
| matti1fileb  | rw     | rw     | rw     | r      | r      |
| matti1filec  | rw     | r      | r      | -      | -      |
| can a user create files in group1files | y | y | y | n | n |



---
## Commands Reference Table

| Command | Description | Example |
|---------|-------------|---------|
| `sudo adduser username` | Create a new user account | `sudo adduser matti1` |
| `sudo addgroup groupname` | Create a new group | `sudo addgroup labgroup1` |
| `sudo usermod -aG groupname username` | Add a user to a group | `sudo usermod -aG labgroup1 matti1` |
| `groups username` | List groups a user belongs to | `groups matti1` |
| `mkdir /path/to/directory` | Create a new directory | `mkdir -p /var/labs/group1files` |
| `chgrp groupname /path/to/directory` | Change group ownership of a directory | `chgrp labgroup1 /var/labs/group1files` |
| `touch filename` | Create a new empty file | `touch /var/labs/group1files/file1.txt` |
| `chmod u=???,g=???,o=???` | Set file permissions for owner,group, other) | `chmod u=rw,g=r,o=  /var/labs/group1files/file1.txt` |
| `ls -l /path/to/directory` | List files with permissions | `ls -l /var/labs/group1files` |
| `cat filename` | View file contents | `cat /var/labs/group1files/file1.txt` |
