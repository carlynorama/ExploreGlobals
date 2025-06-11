#include "backing_items.h"


//CUSTOM ACCESSORS 
int get_count() {
    return shared_count;
}

void set_count(int n) {
    shared_count = n;
}

int increment_count(int n) { 
    shared_count = shared_count + n;
    return shared_count; 
}

int decrement_count(int n) { 
    shared_count = shared_count + n;
    return shared_count; 
}
