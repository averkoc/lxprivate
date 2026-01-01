---
title: ""
layout: default
---

## Shell  

**Basics**


**What is the Shell?** The shell is a program that starts when you log in, serving as your command-line interface to the system. You can check your assigned shell in `/etc/passwd`.  
```
john@debian:~$ grep "john" /etc/passwd
john:x:1014:1014:,,,:/home/john:/bin/bash
john@debian:~$ 
```

**What is it used for?** Administrators use the shell to manage users, modify permissions, install software packages, and monitor the system. Regular users rely on it for file management, content-related tasks, software development, and data analysis.

**What does the prompt show?** The prompt `john@debian:~$` displays your username (`john`), the computer's hostname (`debian`), and your current directory (`~`). The `~` symbol represents your home directory, which is shorthand for the full path `/home/john`.

**What happens when you type a command and press Enter?** The shell treats your input as a program name and tries to find and execute it. It searches for programs in the directories listed in the `PATH` environment variable. Any extra data after the command consists of options and arguments that get passed to the program.  

---

**Shell Advanced**

**Command chaining** allows you to combine multiple commands conditionally using logical operators. The `&&` (AND) operator executes the second command only if the first succeeds, while `||` (OR) executes the second command if the first fails. For example, `mkdir mydir && cd mydir` will create a directory and then move into it, but only if the directory creation succeeds.

**Redirection** lets you capture a command's output to a file instead of displaying it on screen (stdout). Using the `>` operator, you can save output directly—for instance, `ls -l > filelisting.txt` writes the directory listing to a file rather than printing it to your terminal.

**Pipes** enable you to chain programs together by sending one program's output directly into another program's input using the `|` operator. For example, `ls -l | wc -l` passes the directory listing to the `wc` program, which counts and displays the number of lines.

**Shell scripts** are files containing shell commands and programming structures like variables, `while` and `for` loops. They're designed to automate frequently needed tasks by bundling multiple commands together into reusable programs.  




## Hands-on activities - see video

Copy the following files that we need on hands-on activities.

```bash
{% include wget.html file="/assets/courses.txt" %}
````
```bash
{% include wget.html file="/assets/newusers.txt" %}
````
## Results reporting 
The related video shows the screenshots that you need to paste to LMS answerbox.  


<br/>
  
{% capture commands_content %}
{% include_relative commands.html %}
{% endcapture %}

{% include accordion.html
    id="commands"
    title="Some common commands - you need only a very small subset during this course"
    content=commands_content
%}





