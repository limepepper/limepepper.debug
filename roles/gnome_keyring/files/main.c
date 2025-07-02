#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER_SIZE 1024

int main(int argc, char *argv[]) {
    char buffer[BUFFER_SIZE];

    // Read from stdin
    printf("Reading from stdin:\n");
    if (fgets(buffer, BUFFER_SIZE, stdin) != NULL) {
        printf("STDIN: %s", buffer);
    } else {
        printf("STDIN: (no input)\n");
    }

    // Print command-line arguments
    printf("Arguments received:\n");
    for (int i = 1; i < argc; i++) {
        printf("ARG %d: %s\n", i, argv[i]);
    }

    return 0;
}
