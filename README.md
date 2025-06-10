# Working With C Globals

## Assumptions
- Prefer not to write a whole bunch of new C
- The original C API is not totally under ones own control and its old and crufty style. 

## TODO

- switch to 6.2 to see difference. 

## Related Repos

- https://github.com/carlynorama/UnsafeExplorer
- https://github.com/carlynorama/SwiftLIBPNG (wrapping a system lib)

## Options

### Write Quick Helper C Accessors

If they don't exist, write accessors in C

pro: potentially easy. Swift doesn't even need to know you're misbehaving.
con: no one will stop you from misbehaving.

### Header Tricks?

Is there a way (in a header?) to blanket wrap the C library in a global actor? 

### Let Swift Actor Take Ownership of a Pointer to global C var?

Can you slip a pointer into a type... and then be safe by just accessing the pointer after that? 

## Somehow get all the C code into a global actor?

## Mutex?

So its pretty clear how to write a Mutex or swift, but how would I get a pointer to the C into the type with the Mutex?? Same as problem with Actor really? 


