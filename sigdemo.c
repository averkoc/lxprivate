#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>

// File pointer
FILE *file;

// Signal handler function
void handle_signal(int signum) {
    printf("Received signal %d\n", signum);
    if (file) {
        printf("Closing file...\n");
        fclose(file);
    }
    printf("Exiting...\n");
    exit(0);
}

int main() {
    // Open a file
    unsigned int record_number = 0;
    file = fopen("output.txt", "w");
    if (!file) {
        perror("Failed to open file");
        return 1;
    }

    // Register signal handlers
    signal(SIGINT, handle_signal);
    signal(SIGTERM, handle_signal);

    // Simulate a long-running process
    while (1) {
        fprintf(file, "Writing some data...\n");
        fflush(file);  // Ensure data is flushed to disk
        record_number++;
        printf("Stored record number %d\n", record_number);
        sleep(2);
    }

    return 0;
}
