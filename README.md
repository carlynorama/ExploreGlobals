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



----
## Tool Chain Set Up


tried using Swiftly on MacOS that already had swift installed and it struggled to take control of the Swift

ended up downloading the toolchain manually


plutil -extract CFBundleIdentifier raw \
-o - \
/Users/carlynorama/.swiftly/swift-DEVELOPMENT-SNAPSHOT-2024-10-30-a.xctoolchain/Info.plist


```zsh
plutil -extract CFBundleIdentifier raw \
-o - \
/Users/carlynorama/Library/Developer/Toolchains/swift-6.2-DEVELOPMENT-SNAPSHOT-2025-06-12-a.xctoolchain/Info.plist

TOOLCHAINS=org.swift.620202506121a swift --version
```

swift __attr@MainActor

API notes
file that you stick clang feature

https://clang.llvm.org/docs/APINotes.html
https://github.com/search?q=org%3Aswiftlang+path%3A*.apinotes&type=code

clang attribute push foundation
https://duckduckgo.com/?q=NSSwift+Foundation+UIactor&t=osx&ia=web

has attribute

#if clang

#earns free beer 

jonathan michael

https://developer.apple.com/documentation/foundation/ns_swift_ui_actor

https://github.com/swiftlang/swift-foundation/blob/dcbdbf6430c402a0a7c9fba0ef26b71ac47c8eeb/Sources/_FoundationCShims/include/io_shims.h#L26


https://github.com/swiftlang/swift-migration-guide/blob/217fcfd7d9ec1a0227f4c08a10e081598543ebb8/Guide.docc/IncrementalAdoption.md?plain=1#L329

https://clang.llvm.org/docs/AttributeReference.html#customizing-swift-import


- Can touch the C / can dedicate it to clang 
    - clang annotations

- cant touch the C
    - https://clang.llvm.org/docs/APINotes.html


https://github.com/swiftlang/swift-corelibs-foundation/blob/cac38ff51cd4a120387afb02f065c3f86fcfd42a/Sources/CoreFoundation/CFRuntime.c#L555

https://github.com/swiftlang/swift-java/blob/8de85becdcb47863ad9e4e9464e433bef9f98a9d/Sources/_CShims/process_shims.c#L85


https://github.com/swiftlang/swift-docc/blob/ca63f54f605cd2f2c1c8f2267926db27e2328447/Sources/SwiftDocCUtilities/PreviewServer/RequestHandler/FileRequestHandler.swift#L182

https://github.com/swiftlang/llvm-project/blob/30c6853e16b622c39c7ef0c60794b83ac549a1bc/libcxx/include/cctype#L52

https://github.com/swiftlang/swift-corelibs-foundation/blob/cac38ff51cd4a120387afb02f065c3f86fcfd42a/Sources/CoreFoundation/CFDictionary.c#L284

https://github.com/swiftlang/swift-corelibs-foundation/blob/cac38ff51cd4a120387afb02f065c3f86fcfd42a/Sources/CoreFoundation/CFRuntime.c#L555

https://github.com/search?q=org%3Aswiftlang+path%3A*oundation*.apinotes&type=code

https://github.com/swiftlang/llvm-project/blob/30c6853e16b622c39c7ef0c60794b83ac549a1bc/clang/test/APINotes/Inputs/Headers/ExportAs.apinotes#L3

https://github.com/swiftlang/swift/blob/9a0a831b0198e1b794a66316487aacef3d692ca4/test/APINotes/Inputs/custom-modules/APINotesTest.apinotes#L5

https://github.com/swiftlang/llvm-project/blob/30c6853e16b622c39c7ef0c60794b83ac549a1bc/clang/test/APINotes/Inputs/Frameworks/SomeKit.framework/APINotes/SomeKit.apinotes#L56

https://github.com/swiftlang/swift-migration-guide/blob/217fcfd7d9ec1a0227f4c08a10e081598543ebb8/Guide.docc/IncrementalAdoption.md?plain=1#L329

```
#ifdef __clang_analyzer__
```
https://github.com/search?q=org%3Aswiftlang%20%23pragma%20clang%20diagnostic%20push&type=code

https://github.com/swiftlang/swift-playdate-examples/blob/ff15c7d4824dfea97acb4c25316d2b393bef680d/Package.swift