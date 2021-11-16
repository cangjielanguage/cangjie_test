// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
var obj1 : Base = Data()
var obj2 = obj1.Nest() // EXPECTED: regex object cannot access static member 'Nest'
return 0
}

open class Base {
class Nest {
}
}

class Data <: Base {
}
