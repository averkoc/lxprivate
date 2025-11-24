---
title: ""
layout: default
--- 

## Special Permissions Workshop Instructions - Supports the related Video 

If you find special permissions somewhat messy, here’s some background:
_Linux’s special bits are pragmatic add-ons — they patch gaps in the original permission system, solving real needs without breaking existing behavior, even if the solutions are not elegant or easy to understand intuitively._ 
The main needs they address are:  
* Allow a system utility program to modify protected system files, even when launched from a regular user account (`setuid` bit)  
* Streamline and protect the use of shared directories: files created in directory inherit directory's group (`setgid` bit). Files in directory can be deleted only by file owner (`sticky bit`).

    
---

First, we take a look at special permissions using this slideset: <a href="https://docs.google.com/presentation/d/e/2PACX-1vTS4sBZKxO4pJPDhnMYaQni6IKc3SloYEPibQS2srj4RFCcD-SqXWy8QEUjIma4-WUIbyYQzhxrJ2BY/pub?start=false&loop=false&delayms=60000" target="_blank">Special permissions</a>. After that, we will perform experiments with **setuid**, **setgid** and the **sticky bit**.   

> **NOTE: INSTEAD OF USING john, john1, etc., YOU SHOULD USE YOUR own firstname, firstname1, ...  ACCOUNT IN THE DEMONSTRATIONS.**

### setuid bit demonstration  
Regular users can change there passwords using the `passwd` command. The `passwd` command updates the user's password information stored in `/etc/shadow` file. 
1. Paste into answerbox a screenshot showing the permissions and ownership information of the `passwd` command:  
<img width="847" height="101" alt="image" src="https://github.com/user-attachments/assets/1eea1c40-63fb-45d2-a30f-113596b34b3b" />

2. Paste into answerbox another screenshot showing the permissions and ownership information of the `/etc/shadow` file:  
<img width="788" height="97" alt="image" src="https://github.com/user-attachments/assets/585021d3-3ae3-45e4-8fbf-50c92df858ba" />  
  

3. Next, modify your password and observe how you are able to change the contents of the `/etc/shadow` file even though your user account doesn not have direct permission to modify it.  
<img width="776" height="100" alt="image" src="https://github.com/user-attachments/assets/f5927077-a55c-4135-a9d5-baad3c60dba5" />

You will notice that the date and time of the /etc/shadow file have changed after you updated your password. 

> Change your password back to your firstname.     

**Another program** that uses the setuid bit is `sudo`. Regular users can execute it, but it runs with root privileges. You can give `sudo` a command to execute as root; however, before doing so, it checks the `sudoers` file to determine whether you are authorized to use `sudo` to run commands as root.  

## setgid bit demonstration  
For this and the following demonstrations, you should have the following users and groups configured: 

| User  | Member of Groups     |
|--------|----------------------|
| john1 | team1               |
| john2 | team1               |
| john3 | team1               |
| john4 | team2, team3        |
| john5 | team2, team3        |
| john6 | team2, team3        |



* Create directories `/var/examples/team1files` and `/var/team2files` and set their permissions and ownerships like in the figure below:  
<img width="980" height="58" alt="image" src="https://github.com/user-attachments/assets/66f4c77b-bf84-42d9-80d9-cd87e70326c8" />  

* As user `john1`, create three files — `john1a`, `john1b`, and `john1c` — in `/var/team1files`.
* As user `john4`, create three files — `john4a`, `john4b`, and `john4c` — in `/var/team2files`.

* Paste into answerbox the command `ls -lR /var/examples` output:  
<img width="756" height="481" alt="image" src="https://github.com/user-attachments/assets/47c89244-cda1-4e24-9082-fbfa8e9b2a9b" />

When a directory has the **setgid bit** set, any files created within that directory automatically inherit the **group ownership** of the directory. This makes it easier for team members to manage and share files with the correct group permissions. Without the setgid bit, users must manually change the group ownership of files to achieve the same result.

### Sticky bit demonstration  
Create directoriy `/var/examples/team3files`and set it's permissions and ownerships like in the figure below:  
<img width="983" height="90" alt="image" src="https://github.com/user-attachments/assets/9f7685e6-8743-4ce0-a88b-ce1a95ef9db7" />



* As user `john4`, create three files — `john4a`, `john4b`, and `john4c` — in `/var/team3files`.
* As user `john5`, create three files — `john5a`, `john5b`, and `john5c` — in `/var/team3files`.
* Paste the result of command line `ls -ld /var/examples/team3files/; ls -l /var/examples/team3files/` to anwserbox:
  <img width="1322" height="255" alt="image" src="https://github.com/user-attachments/assets/31b452c7-fe1b-4acf-ba66-503fd9e88c58" />

* As user `john4` try to delete john5a - paste result into answerbox
  <img width="754" height="96" alt="image" src="https://github.com/user-attachments/assets/5d23fcbd-bd4a-4978-8118-00910e574f30" />
* Try to modify john5a contents and paste results to answerbox:  
  <img width="1163" height="100" alt="image" src="https://github.com/user-attachments/assets/937202d0-4045-484f-bfe5-fcab8b10a25b" />
* As user john try to edit john5a file using `sudo nano` - paste text **root could edit /var/examples/team4files/john5a** if it succeeded and text **root couldn't edit /var/examples/team4files/john5a** if it didn't succeed.

--- 
## 🧭 Special permissions Quick Guide (All Special Bits)  

| Example        | Meaning                                 | Notes |
|----------------|------------------------------------------|--------|
| `-rwsr-xr-x`   | **setuid** on executable file            | Runs as file **owner** (e.g., `/usr/bin/passwd`) |
| `-rwxr-sr-x`   | **setgid** on executable file            | Runs as file **group** (rare, but possible) |
| **`drwxrwsr-x`**   | **setgid** on directory                  | New files inherit **directory’s group** — ideal for team-shared folders |
| `drwxrwsr-t`   | **setgid + sticky bit** on directory     | Not so common for team-shared writable directories — files inherit group, and only owners (or root) can delete their own files. |
| `drwxrwxrwt`   | **sticky bit** on public writable directory | Used for **open writable** dirs like `/tmp`; prevents users from deleting others’ files |

## 📝 Takeaway: Team-Shared Directory Permissions  
For practical team-shared directories, admins almost always use **`drwxrwsr-x`**. The other special-bit combinations are typically not applied by admins but are useful to understand.

### 🧩 Additional Note on Modern Linux Systems

On Debian, Ubuntu, and similar distributions, the kernel parameter:

```bash
fs.protected_regular = 2
```
is enabled by default.
This adds extra restrictions on operations within sticky directories (those with +t).   

---
