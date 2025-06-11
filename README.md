# Working With C Globals

## Assumptions
- Prefer not to write a whole bunch of new C, but that may be the result. 
- The original C API is not under ones own control and it's old and has a crufty style. 
- The variable exists for the duration of the program and is created by the C. 

## Where is @main

ExploreGlobals.swift

## TODO

- switch to 6.2 to see difference. 

## Related Repos

- https://github.com/carlynorama/UnsafeExplorer (various C accessors)
- https://github.com/carlynorama/SwiftLIBPNG (wrapping a system lib)

## Options

### Write Quick Helper C Accessors

If they don't exist, write accessors in C

pro: potentially easy if not time consuming. Swift doesn't even need to know you're misbehaving.
con: no one will stop you from misbehaving. (unless write locks in the C, pita. )

### Put lightweight C helper funcs in an actor

#### CounterCompromise.swift

- pro: better than nothing.
- con: 
    - a lot of work for EVERY global and still potentially a bunch of new C.
    - every CounterCompromise points to same global var location. requires discipline to only use shared.  


### Header Tricks?

Is there a way (in a header?) to blanket wrap the C library in a global actor? 

### Let Swift Actor Take Ownership of a Pointer to global C var?

#### ValueMask.swift

pro - the instance is specific to the actual global.
    - in this version no lifetime management, so really only for values that exist for the duration of the program. 

Can you slip a pointer into a type past concurrency checking... and then be safe by just accessing the pointer after that? 

### Write a Custom rather than Generic wrapper

#### CounterMask.swift

### Somehow get all the C code into a global actor?

#### GlobalActor.swift

### Mutex?

#### Mutex.swift

So its pretty clear how to write a Mutex for a Swift-owned value, but how would I get a pointer to the C into the type with the Mutex?? Same as problem with Actor really? 


