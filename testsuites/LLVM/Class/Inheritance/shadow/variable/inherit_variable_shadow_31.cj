// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class GrandFather {
    public var a  = 1
}

open class Father <: GrandFather {}

class Child <: Father {
    public var a  = 2  // EXPECTED: regex error.*? the variable 'a' must not shadow a member variable of the supertype
}