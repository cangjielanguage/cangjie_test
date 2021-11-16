// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class Father {
    public var a  = 1
}

class Child <: Father {
    public var a  = 2  // EXPECTED: regex error.*? the variable 'a' must not shadow a member variable of the supertype
}