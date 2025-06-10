// import BackingC

// // @globalActor actor CGlobal {
// //     typealias ActorType = CHandler
// // }
// //https://swiftwithmajid.com/2024/03/12/global-actors-in-swift/

// @globalActor actor CInterfaceActor : GlobalActor {
//     static let shared: CInterfaceActor = CInterfaceActor()

//     public init() {}
    
// }


// @CInterfaceActor struct Counter {
//     var count:CInt {
//         get {
//             just_an_int
//         }
//     }

// }

// import Synchronization
// // final class MutexWrapper<T>: Sendable {
// //     private let mutex: Mutex<T>
// //     init(value: sending T) {
// //         mutex = .init(value)
// //     } 
// // }
// https://forums.swift.org/t/crash-with-array-unsafeuninitializedcapacity-and-tuples/80369
// import Observation
// @Observable
// final class MutexCounter: Sendable {
//     private let count_mutex = Mutex(0)

// var count: Int {
//     get {
//         self.access(keyPath: \.count)
//         return count_mutex.withLock { count in
//             return count
//         }
//     }

//     set {
//         self.withMutation(keyPath: \.count) {
//             count_mutex.withLock { count in
//                 count = newValue
//             }
//         }
//     }
// }
//     }

//     func increment() {
//         count_mutex.withLock { count in
//             count += 1
//         }
//     }

//     func decrement() {
//         count_mutex.withLock { count in
//             count -= 1
//         }
//     }
//     // ....
// }

// // func parallelComputation() async -> Int {
// //     let fullResult = MutexWrapper<Int>(value: 0)
    
// //     await withTaskGroup(of: Void.self) { taskGroup in
// //         taskGroup.addTask {
// //             let localResult = await Self.cpuIntensiveWork()
// //             fullResult.mutex.withLock { state in
// //                 state += localResult
// //             }
// //         }
// //     }
    
// //     return fullResult.mutex.withLock { $0 }
// // }