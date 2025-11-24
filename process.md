## Process management

| Command | Description | Example |
|---------|-------------|---------|
| `ps` | Show list of running processes. | `ps -e` for all processes, `ps -f` for full details. `ps -auxf` to see process hierarchy, `ps -eLf`  to see threads, [threads](thread.md)   |
| `top` | Real-time process information, including CPU and memory usage. | `top` |
| `kill` | Terminate a process. | `kill PID` for default signal, `kill -SIGKILL PID` for forceful termination. |
| `nice` | Launch a process with lower/higher priority. | `nice -n niceness command` <br> `nice -10 ./longrunningprogram`|

Walkthrough: In addition to the process-related commands included with Debian, we install `htop` and `iftop`. `htop` is more visual than `top`, and we use it to demonstrate how load affects resource consumption. `iftop` shows the amount of traffic between the server and clients. To simulate load, we install the `siege` load testing program on another Debian VM and generate requests to our web server.


Linux signals are a way to interrupt running process. E.g. when you press `ctrl-c` the Linux kernel sends a SIGINT signal to your running program. When you issue poweroff command the kernel sends first SIGTERM to all processes currently in the system. If some process doens't terminate after receiving the SIGTERM then kernel sends it SIGKILL. I demonstrate some of these signals in this walkthroug.




## Jobs management  

You can start long running programs on the background by adding ampersand after the command name. In this way you don't need to wait until the command completes before you can issue other commands. To get the output of a background process you can redirect stdout to a file. See example below:  
`find / -type f  -name myfile > result &`  

Sometimes after starting a progam you may find that it takes a long time to complete. To release your keyboard (stdin) and display (stdout) you can stop the process by pressing `ctrl-z` and continue it's execution on the background by issuing command `bg %id`, where the %id is the job number.

| Command | Use Case | Example |
|---------|----------|---------|
| `fg`    | Brings a job to the foreground, making it the current job. | If you have a text editor like `vim` open in the background, you can bring it to the foreground using `fg %1` where `1` is the job number. |
| `bg`    | Continues a job in the background, allowing it to run while you can still use the terminal. | If you have a process like a `find` command running, you can first stop it by ctrl-z and then put it in the background using `bg %1` so it doesn't block your terminal. |
| `jobs`  | Lists the current jobs running in the background and their statuses. | Simply typing `jobs` will show you a list of all background processes with their job IDs and states, like `[1]+ Running` or `[2]- Stopped`. |


## systemctl commands to manage services (related to systemd)
    
| Command | Description | Example |
|---------|-------------|---------|
| `start` | Starts a service. | `systemctl start nginx` |
| `stop` | Stops a service. | `systemctl stop apache2` |
| `restart` | Restarts a service. | `systemctl restart mysql` |
| `status` | Displays the current status of a service. | `systemctl status ssh` |
| `enable` | Enables a service to start at boot. | `systemctl enable docker` |
| `disable` | Disables a service from starting at boot. | `systemctl disable bluetooth` |
| `reload` | Reloads a service's configuration without restarting it. | `systemctl reload nginx` |

## Package management commands (apt)

| Command | Description | Example |
|---------|-------------|---------|
| **`apt update`** | Updates the list of available packages and their versions, but it does not install or upgrade any packages. | `sudo apt update` |
| **`apt upgrade`** | Installs newer versions of the packages you have. After updating the package list, this is the command to upgrade all your software. | `sudo apt upgrade` |
| **`apt install PACKAGE_NAME`** | Installs a new package. | `sudo apt install git` |
| `apt remove PACKAGE_NAME` | Removes a package from your system. | `sudo apt remove git` |
| `apt purge PACKAGE_NAME` | Removes a package and its configuration files. | `sudo apt purge git` |
| `apt autoremove` | Removes packages that were automatically installed to satisfy dependencies for other packages and are now no longer needed. | `sudo apt autoremove` |
| `apt search KEYWORD` | Searches for a package with the given keyword. | `apt search git` |
| `apt show PACKAGE_NAME` | Displays detailed information about a package. | `apt show git` |

