#ifndef backing_items_h
#define backing_items_h

#include <stdio.h>

int shared_count = 3;

//the getters and setters that "should" exist
int get_count();
void set_count(int n);
int increment_count(int n);
int decrement_count(int n);

#endif /* backing_items */