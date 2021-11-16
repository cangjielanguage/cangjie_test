// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
var obj1 : Base = Data()
var res1 = obj1.I2() // EXPECTED: regex object cannot access static member 'I2'
return 0
}

open class Base {
interface I2 {}
}

class Data <: Base {
}
