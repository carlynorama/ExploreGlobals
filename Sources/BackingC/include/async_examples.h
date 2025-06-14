

__attribute__((swift_attr("@MainActor"))) extern int mainActorGlobal;


__attribute__((swift_attr("@CInterfaceActor"), swift_private)) 
extern int customActorGlobal;

int custom_actor_getter()
__attribute__((swift_attr("@CInterfaceActor")));

int main_actor_getter() 
__attribute__((swift_attr("@UIActor")));

int plain_getter(); 


//getting to know attributes
//will go into swift as UnsafeMutablePointer vs OpaquePointer b/c type def in header
typedef struct { int x; } Foo;

Foo Foo_maker (int x)
__attribute__((swift_name("Foo.init(_:)")));

Foo Foo_zero(void)
__attribute__((swift_name("getter:Foo.zero()")));

void Foo_adder(Foo *foo, int d)
__attribute__((swift_name("Foo.add(self:_:)")));



// __attribute__((swift_attr(“@Sendable”)))
// __attribute__((swift_attr(“@_nonSendable”)))
// __attribute__((swift_attr("nonisolated")))
// __attribute__((swift_attr("@UIActor")))
// __attribute__((swift_attr("sending")))

// __attribute__((swift_async(none)))
// __attribute__((swift_async(not_swift_private, COMPLETION_BLOCK_INDEX))
// __attribute__((swift_async(swift_private, COMPLETION_BLOCK_INDEX)))
// __attribute__((__swift_async_name__(NAME)))
// __attribute__((swift_async_error(none)))
// __attribute__((__swift_attr__("@_unavailableFromAsync(message: \"" msg "\")")))
