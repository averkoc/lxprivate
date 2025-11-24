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
