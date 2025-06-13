
import BackingC

@globalActor actor CInterfaceActor : GlobalActor {
    static let shared: CInterfaceActor = CInterfaceActor()

    public init() {}
    
}

@CInterfaceActor struct IsolatedCounter {

    //Reference to var 'customActorGlobal' is not concurrency-safe because it involves shared mutable state
    // var counterAlias:CInt {
    //     customActorGlobal
    // }

    func getValue() -> CInt {
        custom_actor_getter()
    }

}