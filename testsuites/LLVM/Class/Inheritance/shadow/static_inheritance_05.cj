// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
    static private var test : Array<Bool> = @{true}
}

class Data <: Base {
    static var data: Array<Bool> = test //EXPECTED: regex can not access field 'test'
}

func main(): Int64 {
    Data.test //EXPECTED: regex can not access field 'test'
    return 1
}