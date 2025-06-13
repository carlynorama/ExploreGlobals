import BackingC
@main
struct ExploreGlobals {
    //let counter = ValueMask<CInt>(&shared_count)
    static let counter = IsolatedCounter()

    static func main() async throws {
        //won't work
        //error: reference to var 'shared_count' is not concurrency-safe because it involves shared mutable state
        //when try to run in 5.11 mode non async fails with linker error?
        //duplicate symbols in backing_items.c.o and ExploreGlobals.swift.o
        //print(shared_count)
        //apinotes not working?? 
        //print(callItGeorge)

        print(mainActorGlobal)

        let counterValue = await counter.getValue()
        print(counterValue)

        //why doesn't this fail? custom_actor_getter should be isolated to a different global actor? 
        let directCall = custom_actor_getter()
        print(directCall)

        //C Accessors Work Just Fine
        //Swift can't tell you're behaving badly. 
        print("use accessor", get_count())
        increment_count(5)
        print("use accessor after increment", get_count())

        //Compromise version
        //wrote more custom C, wrap it in an actor for the Swift.
        print(await CounterCompromise.shared.get())



    }
}