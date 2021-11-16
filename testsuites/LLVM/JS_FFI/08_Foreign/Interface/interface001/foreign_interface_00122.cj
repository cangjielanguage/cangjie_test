// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
foreign interface A{
    static func test():Int64
}

foreign{
interface B{
    static func test():Int64
}
}


var a = A.test // EXPECTED: regex function 'test' cannot be accessed by interface name 'A'
var b = B.test // EXPECTED: regex function 'test' cannot be accessed by interface name 'B'