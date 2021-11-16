// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
var obj1 : Base = Data()
var res1 : Int32 = obj1.foo() // EXPECTED: regex object cannot access static member 'foo'
return 0
}

open class Base {
static func foo(parm1: Int32): Int32 {
return 3
}

}

class Data <: Base {
}
