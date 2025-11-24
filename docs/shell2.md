---
title: ""
layout: default
---

# WS - Working with Linux shell

## Overview

The Linux shell provides a consistent interface across distributions, essential for managing remote servers via `ssh` and automating tasks with scripts. Chapters 5, 10, and 11 cover shell basics, pipes and redirection, and scripting.  
Its ability to chain commands with pipes (`|`) and redirect input/output (`>`, `<`, `>>`) enables efficient execution of complex tasks.


## Task

We demonstrate shell capabilities by analyzing a server log containing session attempts over a five-hour interval. After retrieving the file from the Internet, we determine the number of failed and successful logins, the usernames and IPs involved, and related patterns. Along the way, we review basic commands and complete additional tasks.


## Walkthrough steps – some intermediary steps are not listed, see the related video.

1. If you not yet have, create a new user account with your first name on the server (command: `adduser <username>`)
2. Log in the server using the new account (use `ssh` in Windows, macOS, or desktop Linux)
3. Use `wget` to download a sample log-file (averkoc.github.io/lx/auth.log) to your home directory.     
4. Create a directory `analysis` under your home directory and a directory `results` under the analysis directory (`mkdir`).
5. Move `auth.log` file to analysis directory. (`mv` command)
6. Check the size of the downloaded file (`ls -l`)
7. Find the line count of the file (`wc -l auth.log`)
8. Find the line count again but redirect (`>`) the output instead of stdout to `~/analysis/results/myresults`
9. What is the time stamp of the first row (use `head` to look at topmost rows)
10. What is the time stamp of last row (use `tail` to look at bottom rows)
11. Use `grep` to list only rows that show an invalid login attempt. (Hint: contains `Invalid user`)
12. Append (`>>`) text `Failed logins: number` to `myresults` file where the number is the actual number of failed logins.  
    Example: `echo "Failed logins: $(grep -c 'Invalid user' auth.log)" >> ~/analysis/results/myresults`
13. Use `grep` to list only rows that show successful logins. (Hint: contains `Accepted`)
14. Like in 12 but now for successful logins – see video for instructions.
15. Work according to video instructions to list top 5 usernames with failed login attempts (`grep`, `cut`, `sort`, `uniq`, `head`)
16. Work according to video instructions to list top 5 IP addresses with failed login attempts (`grep`, `cut`, `sort`, `uniq`, `head`)
17. Which username appears in the highest number of different source IP addresses?  
    Example:  
    ```bash
    egrep "user [a-z]+ from" auth.log | cut -d' ' -f8,10 | sort | uniq | cut -d' ' -f1 | sort | uniq -c | sort -nr | head -1
    ```

---

**Complete your `myresults` file according to video instructions and submit it to ItsLearning.**
