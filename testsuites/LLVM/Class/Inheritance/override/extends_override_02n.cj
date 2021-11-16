// EXEC: %compiler %cmp_opt -c %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
var obj1 = Data()
var obj2 = Base()
var res1 : Int32 = obj1.foo()
var res2 : Int32 = obj2.foo()

if (res1 != 4 || res2 != 3) {
return 1
}
return 0
}

open class Base {
open func foo(): Int32 {
return 3
}
}

class Data <: Base {
func foo(): Int32 { // EXPECTED: regex need 'override' modifier for function 'foo'
return 4
}
}
