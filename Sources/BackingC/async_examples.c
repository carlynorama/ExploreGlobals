#include "async_examples.h"


int mainActorGlobal = 12;
int customActorGlobal = 24;

int custom_actor_getter() { return customActorGlobal; }

// https://forums.swift.org/t/using-c-functions-as-swift-struct-methods/40396/3
// https://developer.apple.com/videos/play/wwdc2020/10680/
// https://developer.apple.com/documentation/swift/customizing-your-c-code-for-swift
Foo Foo_maker(int x) { 
    Foo myfoo = { x };
    return myfoo; 
}

Foo Foo_zero(void) { return Foo_maker(0); }

void Foo_adder(Foo *foo, int d) {
    (*foo).x = d;
}
