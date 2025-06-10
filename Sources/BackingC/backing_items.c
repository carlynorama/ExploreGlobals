#include "backing_items.h"


//ACCESSORS 
int get_count() {
    return shared_count;
}

int increment_count(int n) { 
    shared_count = shared_count + n;
    return shared_count; 
}

int decrement_count(int n) { 
    shared_count = shared_count + n;
    return shared_count; 
}
