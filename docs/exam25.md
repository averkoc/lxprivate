---
title: ""
layout: default
---  

# Linux Essentials Practical Exam

In this exam, you will apply the skills acquired in prior workshops.

Each student has been given an account on the Linux server:

```
lxcentria.westeurope.cloudapp.azure.com
```

Your first task is to log in with your account and password and then log out just to verify your account/password is working. 
After this, you will set up SSH key-based authentication and use it for all remaining tasks.

⚠️ **Important:** Password-based authentication will only be available for the **first exam hour**. After that, only key-based login will work. Plan your time carefully.

---

## Part I – Access and Key Setup

1. **Login to the server with your account and password.**
   Use the following command, replacing `youraccount` with the account sent to you by email:

   ```bash
   ssh youraccount@lxcentria.westeurope.cloudapp.azure.com
   ```

   * Be careful when entering your password: too many failed attempts will temporarily block your IP.
   * Once you have verified login, **log out**.

2. **Generate a public/private SSH keypair** on your local computer.

3. **Copy your public key to the server.**
   Use the skills from SSH Workshop (e.g., `ssh-copy-id` or manual copy). 

4. **Test key-based login.**
   Verify you can log in without a password:

   ```bash
   ssh youraccount@lxcentria.westeurope.cloudapp.azure.com
   ```

---

## Part II – Server-side Tasks

5. **Check your group memberships.**
   Use appropriate commands (e.g., `groups`, `id`) to list the groups your account belongs to.

6. **Work with the your team project directory.**

   * Copy the file:

     ```bash
     /var/www/html/template.html
     ```

     into your group’s project directory as **three separate files** named:

     ```
     firstnamelastname1.html
     firstnamelastname2.html
     firstnamelastname3.html
     ```

     **Replace firstname and lastname with your real names as in your Centria email, but do not include any dashes (-) or dots (.) in the filename.**

   * Edit each file:
     Update the heading, author, and filename information inside each copy.

   * Apply correct file permissions:
     Set the permissions so that each file fulfills the requirements for **Task1, Task2, and Task3**.
     * Task1: firstnamelastname1.html - This file can be modified by me and my team members. All others can only read it.
     * Task2: firstnamelastname2.html - This file can be modified only by me. All others can only read it.
     * Task3: firstnamelastname3.html - This file can be modified only by me. My team members can read it. Others can't even read it.
    
       You are the file owner of each file above so the 'me' means you.
     

   * **Verify your work:**
     Use `ls -l` and other commands to confirm the permissions are exactly as required.

---

## Submission and Evaluation

* You do **not** need to submit anything manually.
* Your instructor will verify:

  * That you successfully used key-based authentication (via server logs).
  * That your three files exist in the correct directory and meet the Task1–Task3 requirements.

✅ Be systematic, double-check each step, and use your Linux problem-solving skills.

Good luck!

---

## Student Checklist

<ul>
  <li><input type="checkbox"> Logged in with account and password - logged out</li>
  <li><input type="checkbox"> Created SSH keypair locally</li>
  <li><input type="checkbox"> Copied public key to server</li>
  <li><input type="checkbox"> Verified key-based login</li>
  <li><input type="checkbox"> Checked group memberships</li>
  <li><input type="checkbox"> Copied template.html</li>
  <li><input type="checkbox"> Applied correct permissions</li>
  <li><input type="checkbox"> Verified file permissions</li>
  <li><input type="checkbox"> Updated heading, author, filename</li>
</ul>
<br><br>  
 
---  

### Linux Practical Exam – Automatic Assessment

The assessment script runs at 5-minute intervals and checks whether the user's key-based authentication and file-related tasks have been completed correctly.
If everything is set up properly, you will see the following message after you first log out and then log back in — with your own username shown in place of john:

<img width="601" height="114" alt="image" src="images/5380803f1abf.png" />

> If you have just completed the tasks and immediately logged out and back in, the script may not have processed your results yet. In that case, wait a few minutes and try logging in again.


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
