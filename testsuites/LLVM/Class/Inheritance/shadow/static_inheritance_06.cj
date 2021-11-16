// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not can not access field 'data'

open class Base {
    static protected var test : Array<Bool> = @{true}
}

class Data <: Base {
    static var data: Array<Bool> = test
}

func main(): Int64 {
    Data.data
    Data.test //EXPECTED: regex can not access field 'test'
    return 1
}