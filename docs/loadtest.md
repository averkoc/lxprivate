---
title: ""
layout: default
--- 

## Web-server load testing demonstration with siege load generation tool  - See the related Video.

**Install htop monitoring tool into Debian server**  
```bash
sudo apt update && sudo apt upgrade
sudo apt install htop
````

**Install siege into you Mac or Windows wsl**  

```bash
# Note: You install siege into WSL or Mac - NOT INTO Debian!
sudo apt update  && sudo apt upgrade
sudo apt install siege
````
**In Windows/Mac**  
I start siege in my Windows WSL with the given parameters, if you do this you need to replace the server IP with your Debian IP.  
```bash
siege -c 50 -r 500 -d 1 http://192.168.61.5/index.html
# Siege simulates 50 users, each making 500 requests, waiting up to 1 second between requests, all hitting the given UR
````
Below are the results after the test completed.  

<img width="878" height="374" alt="image" src="../images/b8bc103e4e4b.png" />    

The picture below is a screen clip from `htop` during my ssh-session to Debian  while the siege test was running-

<img width="1412" height="629" alt="image" src="../images/7d3722211a75.png" />

**htop view explanations**

| Area / Field     | Meaning                                  |
|------------------|-------------------------------------------|
| CPU bars         | Per-core usage (green=user, red=kernel)   |
| Mem / Swap bars  | RAM and swap usage                        |
| Load average     | System load (1m, 5m, 15m)                 |
| Tasks            | Total processes, threads, running count   |
| PID              | Process ID                                |
| USER             | User running the process                  |
| PRI / NI         | Priority and nice value                   |
| VIRT / RES       | Virtual memory / physical memory used     |
| SHR              | Shared memory                             |
| S                | Process state (S=sleep, R=running, etc.)  |
| CPU% / MEM%      | CPU and RAM used by the process           |
| TIME+            | Total CPU time consumed                   |
| Command          | Process executable + arguments            |
