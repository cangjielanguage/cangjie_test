// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
    static protected var test : Array<Bool> = @{true}
}

class Data <: Base {
    static private var test : Array<Bool> = @{true}    //EXPECTED: regex the variable 'test' should be less restrictive than shadowed variable
}

func main(): Int64 {
    return 1
}