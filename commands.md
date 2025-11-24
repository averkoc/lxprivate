# Commands

- [List Directory Contents](#list-directory-contents)
- [Make a Directory](#make-a-directory)
- [Remove a File](#remove-a-file)
- [Remove a Directory](#remove-a-directory)
- [Change to Another Directory](#change-to-another-directory)
- [Copy a File](copy-a-file)
- [Move a File or Directory](#move-a-file-or-directory)
- [Modify File Permissions](#modify-file-permissions)
- [Change File Ownership](#change-file-ownership)
- [User and Group Management](#user-and-group-management)
- [Show All Groups and Memberships](#show-all-groups-and-memberships)
- [Locate a Command](#locate-a-command)
- [Pattern Matching](#pattern-matching)
- [Find a File by Partial Name](#find-a-file-by-partila-name)
- [Archiving - tar command](#archiving-tar-command)

## List Directory Contents
- **Command**: `ls`
- **Examples**:
  - `ls -a`: Shows hidden files (those starting with `.`).
  - `ls -l`: Displays file details.

## Make a Directory
- **Command**: `mkdir`
- **Example**: `mkdir ~/workshops` (creates a directory under the user's home folder).

## Remove a File
- **Command**: `rm`
- **Example**: `rm myfile`

## Remove a Directory
- **Commands** (use one of these):
  - `rmdir`: Succeeds if the directory is empty.
  - `rm -r` or `rm -rf`: Removes the directory and its contents.

## Change to Another Directory
- **Command**: `cd`
- **Example**: `cd /etc`
- **Note**: `cd` alone changes to user's home directory. Equal to `cd ~`.

## Copy a File
- **Command**: `cp`
- **Example**: `cp data.txt ./archive`
- **Note**: Copying a directory requires the `-r` option.

## Move a File or Directory
- **Command**: `mv`
- **Example**: `mv data.txt ./archive`

## Modify File Permissions
- **Command**: `chmod`
- **Note**: Only the file/directory owner (and root) can modify file/directory permissions.
- **Examples**:
  - `chmod 755 mytext` _#user rwx, group r-x, others r-x_
  - `chmod u=rwx,go=rx mytext` _#same result as the above_
  - `chmod u-x,go-w mytext` _#take out x permission from user and w permission from group and others_
  - `chmod u+x,go+w mytext` _#opposite to the above
  </br>    
**Special permissions**
  - setgid bit for a directory makes the files in the directory inherit the directory's group onwership.
    - **command**:`chmod g=rwxs directory`  
>This is very practical e.g. for team members that creates files to the directory. When they create files the files group ownership is automatically set to the group that owns the directory. Typically root user sets the setgid bit for a directory to make team members work more streamlined.  
      

## Change File Ownership  
Users can change only their own files group ownership to a different group if they are members in that group. Root user (or user with sudo-rights) can change both user owner and group owner for all files.
- **Command**: `chown user:group file`
- **Example**: `chown :course /var/coursefiles`

## User and Group Management
 **Only root (or user with sudo rights) can issue these commands.**  
- **Create a new user**: `adduser student2`
- **Delete a user account and users home directory**: `userdel -r student2`
- **Create a new group**: `addgroup webmasters`
- **Add a user to a group**: `gpasswd -a user group`  e.g. `gpasswd -a student2 webmasters`  
 (also `usermod -a -G group user` e.g. `usermod -a -G webmasters student2`)  
- **Show user's group memberships**: `id sakari` _#This doesn't require root privileges_
- **Remove a user from a group**: `gpasswd -d user group` e.g. `gpasswd -d student2 webmasters`   
(also `usermod -r -G group user` e.g. `usermod -r -G webmasters student2`)  
  
- **Change another user's password**: `sudo passwd student2`

## Show All Groups and Memberships
- **Command**: `cat /etc/group`
- Users can check their group memberships by command `id`  

## Locate a Command
- **Command**: `which`
- **Example**: `which useradd`

## Pattern Matching
- **Command**: `grep`
- **Examples**:
  - `grep -n 'Apache2 Default Page' /var/www/html/index.html`  
    Shows the line(s) with line number(s) where the text 'Apache2 Default Page' appears in the index.html file.
  - `ls /etc | grep -E "co?nf$"`  
    Shows the files in /etc directory that ends e.g. either in cnf or conf. In this example the output of `ls` command is directed (piped) to `grep` command.

## Find a File by Partial Name
- **Command**: `find`
- **Example**: `find /etc -name *conf`
- **Note**: The `find` command is very versatile and can be used for various purposes, including executing a command for each found file.

## Archiving tar command
The important feature of tar archiving command is that it preserves ownership and permissions information.
- **Create an archive**:
  - **Command**: `tar -czvf`
  - **Example**: `tar -czvf webbisivut.tz /var/www`
- **List files in an archive**:
  - **Command**: `tar -tzvf`
  - **Example**: `tar -tzvf webbisivut.tz`
- **Extract files from an archive (to the current directory)**:
  - **Command**: `tar -xzvf`
  - **Example**: `tar -xzvf webbisivut.tz`
