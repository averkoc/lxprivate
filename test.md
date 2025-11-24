## Jump List

<details open>
  <summary>Commands</summary>
  <ul style="display: inline-flex; list-style: none; padding: 0;">
    <li style="margin-right: 10px;"><a href="#List-Directory-Contents">`ls`</a></li>
    <li style="margin-right: 10px;"><a href="#Make-a-Directory">`mkdir`</a></li>
    <li style="margin-right: 10px;"><a href="#Remove-a-File">`rm`</a></li>
    <li style="margin-right: 10px;"><a href="#Remove-a-Directory">`rmdir`</a> / <a href="#Remove-a-Directory">`rm -r`</a></li>
    <li style="margin-right: 10px;"><a href="#Change-to-Another-Directory">`cd`</a></li>
    <li style="margin-right: 10px;"><a href="#Copy-a-File">`cp`</a></li>
    <li style="margin-right: 10px;"><a href="#Move-a-File-or-Directory">`mv`</a></li>
    <li style="margin-right: 10px;"><a href="#Modify-File-Permissions">`chmod`</a></li>
    <li style="margin-right: 10px;"><a href="#Change-File-Ownership">`chown`</a></li>
    <li style="margin-right: 10px;"><a href="#User-and-Group-Management">User/Group</a></li>
    <li style="margin-right: 10px;"><a href="#Show-All-Groups-and-Memberships">`/etc/group`</a></li>
    <li style="margin-right: 10px;"><a href="#Locate-a-Command">`which`</a></li>
    <li style="margin-right: 10px;"><a href="#Pattern-Matching">`grep`</a></li>
    <li style="margin-right: 10px;"><a href="#Find-a-File-by-Partial-Name">`find`</a></li>
    <li style="margin-right: 10px;"><a href="#Archiving---tar-command">`tar`</a></li>
  </ul>
</details>

## Commands

### List Directory Contents
- **Command:** `ls`
- **Examples:**
  - `ls -a`: Shows hidden files (those starting with `.`).
  - `ls -l`: Displays file details.

### Make a Directory
- **Command:** `mkdir`
- **Example:** `mkdir ~/workshops` (creates a directory under the user's home folder).

### Remove a File
- **Command:** `rm`
- **Example:** `rm myfile`

### Remove a Directory
- **Commands (use one of these):**
  - `rmdir`: Succeeds if the directory is empty.
  - `rm -r` or `rm -rf`: Removes the directory and its contents.

### Change to Another Directory
- **Command:** `cd`
- **Example:** `cd /etc`
- **Note:** `cd` alone changes to user's home directory. Equal to `cd ~`.

### Copy a File
- **Command:** `cp`
- **Example:** `cp data.txt ./archive`

### Move a File or Directory
- **Command:** `mv`
- **Example:** `mv data.txt ./archive`

### Modify File Permissions
- **Command:** `chmod`
- **Note:** Only the file/directory owner (and root) can modify file/directory permissions.
- **Examples:**
  - `chmod 755 mytext` _#user rwx, group r-x, others r-x_
  - `chmod u=rwx,go=rx mytext` _#same result as the above_
  - `chmod u-x,go-w mytext` _#take out x permission from user and w permission from group and others_
  - `chmod u+x,go+w mytext` _#opposite to the above_

### Change File Ownership
- **Command:** `chown user:group file`
- **Example:** `chown :course /var/coursefiles`

### User and Group Management
- **Note:** Only root (or user with sudo rights) can issue these commands.
- **Commands:**
  - Create a new user: `adduser student2`
  - Create a new group: `addgroup webmasters`
  - Add a user to a group: `gpasswd -a student2 webmasters`
  - Show user's group memberships: `id sakari` _#This doesn't require root privileges_
  - Remove a user from a group: `gpasswd -d`
  - Example: `gpasswd -d student2 webmasters`
  - Change another user's password: `sudo passwd student2`

### Show All Groups and Memberships
- **Command:** `cat /etc/group`

### Locate a Command
- **Command:** `which`
- **Example:** `which useradd`

### Pattern Matching
- **Command:** `grep`
- **Examples:**
  - `grep -n 'Apache2 Default Page' /var/www/html/index.html`  
    Shows the line number where the text 'Apache2 Default Page' appears in the index.html file.
  - `ls /etc | grep -E "co?nf$"`  
    Shows the files in /etc directory that ends e.g. either in cnf or conf. In this example the output of ls command is directed (piped) to grep command.

### Find a File by Partial Name
- **Command:** `find`
- **Example:** `find /etc -name *conf`
- **Note:** The `find` command is very versatile and can be used for various purposes, including executing a command for each found file.

### Archiving - tar command
- **Create an archive:**
  - **Command:** `tar -czvf`
  - **Example:** `tar -czvf webbisivut.tz /var/www`
- **List files in an archive:**
  - **Command:** `tar -tzvf`
  - **Example:** `tar -tzvf webbisivut.tz`
- **Extract files from an archive (to the current directory):**
  - **Command:** `tar -xzvf`
  - **Example:** `tar -xzvf webbisivut.tz`
