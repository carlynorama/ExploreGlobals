import BackingC

actor CustomCounterMask {
    static let shared = CustomCounterMask()

    func get() -> CInt {
        //still the problem is not the Swift.. its the C
        //return shared_count
        return 0
    }

}