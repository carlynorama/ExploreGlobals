import BackingC


//Problem: pointer will still be coming in as a global. 
//Also has dealloc problem which can maybe get away with ignoring if truly a global
actor ValueMask<V> {
    let ptr:UnsafeMutablePointer<V>

    init(_ ptr:UnsafeMutablePointer<V>) {
        self.ptr = ptr
    }

    func get() -> V {
        ptr.pointee
    }

    func set(_ value:V) {
        ptr.pointee = value
    }
    
}