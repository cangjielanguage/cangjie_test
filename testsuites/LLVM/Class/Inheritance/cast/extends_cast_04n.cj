// EXEC: %compiler %cmp_opt %f -o %output 2>&1| compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
}

class Data <: Base {
static func foo(parm1: Int32): Int32 {
return 3
}
}

func main(): Int64 {
var obj : Data = Data(Base()) // EXPECTED: regex no matching constructor for call
var res : Int32 = obj.foo() // EXPECTED: regex object cannot access static member 'foo'
return 0
}
