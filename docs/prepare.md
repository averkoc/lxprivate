---
title: ""
layout: default
---


## Preparing for the Practical Exam

The practical exam tests your understanding and hands-on skills with SSH key-based authentication and file permissions. You will also need basic command-line skills. As with all exams, the ability to correctly interpret instructions is important.

### Setting up Key-Based Authentication on a Remote Server
First, generate an SSH key pair on your local computer using the `ssh-keygen` command.  
Next, copy the generated public key to the server using the `ssh-copy-id` command.

Both commands are executed on your local machine.  
The `ssh-copy-id` program connects to the server, prompts you for your password, and copies your public key into the server’s `~/.ssh/authorized_keys` file.

### File Permissions and Ownership
"aI" have created a [file permission simulator](perms.html) that you can use to explore how file ownership (user and group) affects what different users can do with a file.

First, select the user you are logged in as, then choose a file by clicking on it. The simulator will show what actions that user is allowed to perform on the selected file.  
If the selected user is the file’s owner, you can also modify the file’s permissions using the `chmod` command — represented here by adjusting the checkboxes. 

<br>  
---  

<br>
<div class="accordion">
  <input type="checkbox" id="accordion1" class="accordion-toggle">
  <label for="accordion1" class="accordion-header">
    Some often needed commands
  </label>
  <div class="accordion-content" markdown="1">  
  



| Command | Description | Examples |
|---------|-------------|----------|
| `ssh` | Secure shell remote login | `ssh user@hostname` |
| `ssh-keygen` | Generate SSH key pair | `ssh-keygen` |
| `ssh-copy-id` | Copy SSH public key to server | `ssh-copy-id user@hostname` |
| `exit` | Exit from shell or logout | `exit` (ctrl-d does the same) |
| `groups` | Display group memberships | `groups`<br>`groups username` |
| `id` | Display user and group IDs | `id`<br>`id username` |
| `pwd` | Print working directory | `pwd` |
| `cd` | Change directory | `cd /path/to/directory`<br>`cd ..` (go up one level)<br>`cd ~` (go to home directory) |
| `ls` | List directory contents | `ls -l` (detailed list)<br>`ls -la` (show hidden files) |
| `cp` | Copy files or directories | `cp source.txt dest.txt`<br>`cp file.txt /path/to/dest/` |
| `chmod` | Change file permissions | `chmod u=rwx,g=rx,o=rx file.txt`<br> `chmod u+x file.txt (add execute for user)` |
| `nano` | Simple text editor | `nano file.txt` |
| `rm` | Remove a file | `rm myfile` |
| `cat` | Display file contents | `cat file.txt` | 

</div>
