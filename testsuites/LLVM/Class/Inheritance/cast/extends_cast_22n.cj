// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
var obj1 : Base = Data()
var res1 : Int32 = obj1.a // EXPECTED: regex object cannot access static member 'a'
return 0
}

open class Base {
static var a : Int32 = 2
}

class Data <: Base {
}
