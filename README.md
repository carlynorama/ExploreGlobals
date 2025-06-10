# Working With C Globals

## Assumptions
- Prefer not to write a whole bunch of new C, but that may be the result. 
- The original C API is not totally under ones own control and its old and crufty style. 

## TODO

- switch to 6.2 to see difference. 

## Related Repos

- https://github.com/carlynorama/UnsafeExplorer
- https://github.com/carlynorama/SwiftLIBPNG (wrapping a system lib)

## Options

### Write Quick Helper C Accessors

If they don't exist, write accessors in C

pro: potentially easy if not time consuming. Swift doesn't even need to know you're misbehaving.
con: no one will stop you from misbehaving. (unless write locks in the C, pita. )

### Put lightweight C helper funcs in an actor

#### CounterCompromise.swift

- pro: better than nothing.
- con: a lot of work for EVERY global and still potentially a bunch of new C. 

### Header Tricks?

Is there a way (in a header?) to blanket wrap the C library in a global actor? 

### Let Swift Actor Take Ownership of a Pointer to global C var?

#### ValueMask.swift

Can you slip a pointer into a type... and then be safe by just accessing the pointer after that? 

### Write a Custom rather than Generic wrapper

#### CounterMask.swift

### Somehow get all the C code into a global actor?

#### GlobalActor.swift

### Mutex?

#### Mutex.swift

So its pretty clear how to write a Mutex for a Swift-owned value, but how would I get a pointer to the C into the type with the Mutex?? Same as problem with Actor really? 


