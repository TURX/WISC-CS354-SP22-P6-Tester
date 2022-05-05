#ifndef P6_CACHE_TEST_H
#define P6_CACHE_TEST_H

// THE CACHE
struct LINE {
    char valid;
    int tag;
    char data[32];
};

struct SET {
    struct LINE line[1];
};

struct CACHE {
    struct SET set[8];
} cache;

// GLOBALDATA
// increment these in your function
unsigned hit_count;
unsigned miss_count;
unsigned read_data_count;

// SYSTEM BUS
// call Read_Data_From_Ram to update this
char system_bus[32];

char Read_Data_From_Cache(unsigned address);

#endif // P6_CACHE_TEST_H
