---
title: ""
layout: default
---


## 🧪 Linux Signals Demo: A Hands-On Worksheet  
### 🎯 Objective
Understand how Linux signals (e.g. SIGINT) can interrupt a program and cause data loss if not handled properly. Learn how to use signal handlers to flush buffered data before exiting.

#### 🧰 Part 1: Unhandled Signal (Data Loss)  
📄 Code: unhandled.c
```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    FILE *fp = fopen("output.txt", "w");
    if (!fp) {
        perror("fopen");
        return 1;
    }

    for (int i = 0; i < 100000; ++i) {
        printf("Line %d\n", i);
        fprintf(fp, "Line %d\n", i);
        usleep(1000); // Slow enough to interrupt
    }

    fclose(fp);
    return 0;
}
```
##### 🧪 Instructions  
**Compile:**  
`gcc -o unhandled unhandled.c`  
Run:  
`./unhandled`  
Press Ctrl+C after a few seconds.  

**Compare:**  
Last line printed in terminal   
Last line saved in output.txt  

**🔍 Observation**  
You’ll likely see that output.txt is missing the last few lines—because the buffer wasn’t flushed before the program was interrupted.

#### ✅ Part 2: Handled Signal (Data Preserved)  
📄 Code: handled.c
```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>

FILE *fp;

void handle_sigint(int sig) {
    printf("Caught SIGINT, flushing and closing file.\n");
    if (fp) {
        fflush(fp);
        fclose(fp);
    }
    exit(0);
}

int main() {
    signal(SIGINT, handle_sigint);

    fp = fopen("output.txt", "w");
    if (!fp) {
        perror("fopen");
        return 1;
    }

    for (int i = 0; i < 100000; ++i) {
        printf("Line %d\n", i);
        fprintf(fp, "Line %d\n", i);
        usleep(1000);
    }

    fclose(fp);
    return 0;
}
```
##### 🧪 Instructions  
Compile:  
`gcc -o handled handled.c`  
Run:  
`./handled`  
Press Ctrl+C after a few seconds.  

**Compare:**  
Last line printed in terminal   
Last line saved in output.txt  

🔍 Observation

The file will contain all lines up to the interruption—because the signal handler flushed and closed the file properl
