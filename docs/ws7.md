---
title: ""
layout: default
--- 

## Processes, Jobs mgmt workshop instructions - Supports the related Video. 

In this workshop, we focus on managing our own user processes. You’ll learn how to run programs interactively in the foreground or silently in the background. While a program is running in the foreground, you can pause it with `Ctrl+Z` and then resume it in the background using `bg`. To bring a background job back to the foreground, use `fg`. You can also stop a foreground job with `Ctrl+C`, check job status with jobs, and locate or terminate your own processes by name using `pgrep` and `pkill`.   

<img width="614" height="360" alt="image" src="images/a24812307964.png" />




**Job management commands**  

| Action | Command / Shortcut | Description |
|--------|-----------------|-------------|
| Start job in background | `program &` | Runs the program in the background immediately |
| Pause foreground job | `Ctrl+Z` | Suspends the running job and moves it to the background in a paused state |
| Stop foreground job | `Ctrl+C` | Terminates the running foreground job immediately |
| View jobs | `jobs` | Lists all jobs started in the current shell session |
| Resume paused job in background | `bg` | Continues a suspended job in the background |
| Bring background job to foreground | `fg` | Brings a background or paused job to the foreground |
| Find your process by name | `pgrep <name>` | Lists PIDs of processes owned by you matching the name |
| Terminate your process by name | `pkill <name>` | Stops processes owned by you matching the name |


### Programs needed in demonstrations


| Program         | Purpose / Demonstration                 | Description                                                                                   |
|-----------------|----------------------------------------|-----------------------------------------------------------------------------------------------|
| `longrunning.c` | Foreground & background processes       | A simple long-running program used to show job control. You can run it in the foreground, move it to the background, and bring it back to the foreground. |
| `ignorant.c`    | Signal handling (ignores signals)      | Demonstrates a program that does not handle signals like `SIGINT` or `SIGTERM`. Interrupts are ignored, showing the effect of not catching or handling signals. |
| `graceful.c`    | Signal handling (graceful termination) | Demonstrates catching signals (e.g., `SIGINT` and `SIGTERM`) to perform cleanup and exit gracefully, ensuring resources are released properly before the program ends. |

## Workshop steps 

**Preparations**

* download the demo programs using wget (or curl in mac)  
```bash
wget averkoc.github.io/lx/assets/longrunning.c  
wget averkoc.github.io/lx/assets/ignorant.c
wget averkoc.github.io/lx/assets/graceful.c
````
* compile the programs
```bash
# Install gcc compiler
sudo apt update && sudo apt upgrade
sudo apt install gcc
# compile
gcc -o longrunning longrunning.c
gcc -o ignorant ignorant.c
gcc -o graceful graceful.c
````
---  

### Foreground / Background demonstrations  

**Interrupt (stop) a foreground program**
* run the longrunning in foreground: `./longrunning`
* interrupt it by `ctrl-c`
* attach a screen clip
  
<img width="724" height="239" alt="image" src="images/4759aa772dba.png" />



---  

**Run a program in the background**  
* `./longrun > output &`
* use `jobs` command to see your background jobs
* attach a screen clip
  
<img width="753" height="133" alt="image" src="images/9df88c11e39b.png" />


---  

**Kill a background job**  
* `./longrun > output &`
* `pkill longrun`
* attach a screen clip
  
<img width="767" height="144" alt="image" src="images/410406f5a821.png" />



---   


### Signal handling demonstrations  
An operating system can send various signals to processes (running programs). Each signal has a default action, but many complex programs need to implement their own signal handlers to properly handle tasks such as closing files or terminating network connections. When the user presses Ctrl+C, the kernel sends a SIGINT signal to all processes in the foreground process group. The default action is to terminate the process immediately, which may cause any unsaved buffered data to be lost and network connections to close abruptly without proper termination. The `ignorant.c` program illustrates a problem that may arise if the program doesn't provide its own signal handler for SIGINT. The `graceful.c` fixes the problem by a proper SIGINT signal handler.    

--- 


**Losing data when program is interrupted**  
* run the `ignorant` and interrupt it by pressing `ctr-c`
* compare the last line listed when the program was running and the last line in data.txt file
* take a screen clip that shows the difference - buffered data was lost due.
  
<img width="548" height="541" alt="image" src="images/adad0f051713.png" />



---


**Own signal handler takes proper actions when SIGINT is received**  
* run the `graceful`and interrupt it by pressing `ctrl-c`
* compare the last line listed when the program was running and the last line in data.txt file
* take a screen clip that shows the difference - no lost data.
  
<img width="760" height="570" alt="image" src="images/31b5e67278e1.png" />


----
In addition to the activities mentioned above, there is an additional video that demonstrates web server load testing and how the load impacts CPU, memory, and network resources. Here is the supplementary [page](loadtest.md) for the load testing video.

> Here is my old [ws7](ws7old.md), it contains information about service management and package management.

