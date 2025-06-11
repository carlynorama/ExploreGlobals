import BackingC


//Problem: pointer will still be coming in as a global. 
//Also has access after free problem which can maybe get away with ignoring 
//if truly a lifetime of the application global, but there is nothing inherently
//stopping one from using it badly. 
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