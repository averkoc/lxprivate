---
layout: default
title: ""
---



### longrunning.c 

````c
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

    fp = fopen("data.txt", "w");
    if (!fp) {
        perror("fopen");
        return 1;
    }

    for (int i = 0; i < 100; ++i) {
        printf("Line %d\n", i);
        fprintf(fp, "Line %d\n", i);
        sleep(2);
    }

    fclose(fp);
    return 0;
}
````

### ignorant.c  
````c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    FILE *fp = fopen("data.txt", "w");
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

````
### graceful.c  

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

    fp = fopen("data.txt", "w");
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
````


