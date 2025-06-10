import BackingC
@main
struct ExploreGlobals {
    //let counter = ValueMask<CInt>(&shared_count)

    static func main() async throws {
        //won't work
        //error: reference to var 'shared_count' is not concurrency-safe because it involves shared mutable state
        //when try to run in 5.11 mode non async fails with linker error?
        //duplicate symbols in backing_items.c.o and ExploreGlobals.swift.o
        //print(shared_count)

        //C Accessors Work Just Fine
        //Swift can't tell you're behaving badly. 
        print(get_count())
        increment_count(5)
        print(get_count())

        //With a ValueMask
        //Won't accept the pointer as an initializer because still shared mutable. 
        //let counter = ValueMask<CInt>(&shared_count)


    }
}