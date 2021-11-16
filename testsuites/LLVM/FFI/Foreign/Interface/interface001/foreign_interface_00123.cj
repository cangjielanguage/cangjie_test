// EXEC:%compiler -frontend -typecheck %jsbackend %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign interface A{
static func test():Int64
}

foreign{
interface B{
static func test():Int64
}
}


var a = A.test()
var b = B.test()
