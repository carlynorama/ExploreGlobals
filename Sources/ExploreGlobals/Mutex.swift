import Synchronization

// final class MutexWrapper<T>: Sendable {
//     private let mutex: Mutex<T>
//     init(value: sending T) {
//         mutex = .init(value)
//     } 
// }



import Observation
@Observable
final class ObservableMutexCounter: Sendable {
    private let count_mutex = Mutex(0)

var count: Int {
    get {
        self.access(keyPath: \.count)
        return count_mutex.withLock { count in
            return count
        }
    }

    set {
        self.withMutation(keyPath: \.count) {
            count_mutex.withLock { count in
                count = newValue
            }
        }
    }
}
    

    func increment() {
        count_mutex.withLock { count in
            count += 1
        }
    }

    func decrement() {
        count_mutex.withLock { count in
            count -= 1
        }
    }
    // ....
}