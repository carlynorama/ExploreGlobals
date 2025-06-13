//Should be able to access anything isolated to the MainActor

import BackingC

@MainActor
struct GlobalGetter {
    var testFetch: CInt {
        mainActorGlobal
    }
}