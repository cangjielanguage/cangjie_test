// EXEC:%compiler -frontend -typecheck %jsbackend %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class A{
func test():Int32
}


foreign{
class B{
func test():Int32
}
}

var x : Int32 = A().test()
var y : Int32 = B().test()
