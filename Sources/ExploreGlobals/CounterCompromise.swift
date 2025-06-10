import BackingC

actor CounterCompromise {
    static var shared = CounterCompromise()

    func get() -> CInt{
        get_count()
    }

    func set(_ n:CInt) {
        set_count(n)
    }
}