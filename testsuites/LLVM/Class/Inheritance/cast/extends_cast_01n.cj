// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
var test : Int32 = 1
}

class Data <: Base {}

func main(): Int64 {
var obj : Data = Base() // EXPECTED: regex no matching constructor for call 'Base'
var res : Int32 = obj.test
return 0
}
