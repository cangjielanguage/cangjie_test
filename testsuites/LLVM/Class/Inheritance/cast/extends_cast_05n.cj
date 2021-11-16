// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
}

class Data <: Base {
class Nest {
}
}

func main(): Int64 {
var obj : Data = Data(Base()) // EXPECTED: regex no matching constructor for call
var obj2 = obj.Nest() // EXPECTED: regex object cannot access static member 'Nest'
return 0
}
