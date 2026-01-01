---
title: ""
layout: default
---

## Shell Basics  



**What is the Shell?** A program that starts when you log in. You can check your assigned shell in `/etc/passwd`.  
![shell](../images/shell.png)  

**What is it used for?**   
- **Administrators:** Manage users (create new users, modify permissions), install software packages, monitor the system, etc.  
- **Regular users:** Manage files, support tasks related to content management, software development, data analysis, etc.

**What does the prompt show? Example: `john@debian:~$`**  
- Username `john`
- The computer’s hostname `debian`
- Current directory `~`

> The `~` symbol represents user's home directory, saves space compared to full path /home/john.

**What happens when you type a command and press Enter?** The shell treats it as a program (=command) name and tries to find and execute it.  

**Where does the shell look for the program?** In the directories listed in the `PATH` environment variable.  

**What about extra data after the command?** These are options and arguments that the shell passes to the program.

--- 
## Shell Advanced  
**Command chaining**  You can combine multiple commands condtionally using logical operators `&&`(AND)  `||` (OR). Eg.  
`mkdir mydir && cd mydir` # If mydir creation succeed move to mydir -directory  

**Redirection**  Instead of printing a command's output to dislay (actually stdout) you can redirect it to file. E.g.  
`ls -l > filelisting.txt` # Command's output is now in the file filelisting.txt   

**Pipes** You can "give" one programs output to another program's input using pipe. E.g.  
`ls -l | wc -l` # the listing is directed to wc program that counts the number of lines in the input and prints it.    

## Shell scripts  
Files that contain shell commands and programming structures like variables, `while` and `for` loops. They are designed to automate frequently needed tasks.

## Features That Help You Work Efficiently  

| #  | Feature              | Key/Command          | What It Does / Example Use                          |
|----|---------------------|----------------------|-----------------------------------------------------|
| 1  | **Browse history**      | ↑ / ↓ (arrow keys)   | Cycle through previously entered commands           |
| 2  | **Search history**      | Ctrl+ r + text        | Reverse search: find and reuse a previous command   |
| 4  | **Tab completion**      | Tab         | Auto-complete file or command names|
| 4  | Profile files      |          | User can tailor the environment e.g. by defining aliases for long commands|



---  


## Hands-on activities - see video

Copy the following files that we need on hands-on activities.  

```bash
{% include wget.html file="/assets/courses.txt" %}
````
```bash
{% include wget.html file="/assets/newusers.txt" %}
````

<br/>
  
{% capture commands_content %}
{% include_relative commands.html %}
{% endcapture %}

{% include accordion.html
    id="commands"
    title="Most common commands"
    content=commands_content
%}

