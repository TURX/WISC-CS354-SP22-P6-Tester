#include "cache_test.h"
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc != 4) {
        printf("Usage: %s <start_index> <end_index> <interval>\n", argv[0]);
        return 1;
    }

    hit_count = 0;
    miss_count = 0;
    read_data_count = 0;

    int start_index = atoi(argv[1]);
    int end_index = atoi(argv[2]);
    int interval = atoi(argv[3]);

    // INITIALIZE CACHE
    for (int i = 0; i < 8; i++) cache.set[i].line[0].valid = 0;
    printf("Reading character starting at index %d to %d with an interval of %d\n\n", start_index, end_index, interval);

    // READ SOME DATA
    char c;
    for (int i = start_index; i < end_index; i += interval) {
        c = Read_Data_From_Cache(i);
        printf("Reading character at index %-3u : data = %c : hit count = %-3u : miss count = %-3u : read data count = %-3u\n",
               i, c, hit_count, miss_count, read_data_count);
    }

    return 0;
}
