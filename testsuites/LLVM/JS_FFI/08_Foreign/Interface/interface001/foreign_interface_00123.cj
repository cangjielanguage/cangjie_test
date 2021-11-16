// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
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


var a = A.test() // EXPECTED: regex function 'test' cannot be accessed by interface name 'A'
var b = B.test() // EXPECTED: regex function 'test' cannot be accessed by interface name 'B'
