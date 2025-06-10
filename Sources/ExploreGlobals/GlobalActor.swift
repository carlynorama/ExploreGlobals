import BackingC

@globalActor actor CInterfaceActor : GlobalActor {
    static let shared: CInterfaceActor = CInterfaceActor()

    public init() {}
    
}


@CInterfaceActor struct Counter {
    var count:CInt {
        get {
            //still shared mutable state.
            //shared_count
            return 0
        }
    }

}