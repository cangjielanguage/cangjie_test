// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
}

class Data <: Base {
interface I2 {}
}

func main(): Int64 {
var obj : Data = Data(Base()) // EXPECTED: regex no matching constructor for call
var res1 = obj.I2() // EXPECTED: regex object cannot access static member 'I2'
return 0
}
