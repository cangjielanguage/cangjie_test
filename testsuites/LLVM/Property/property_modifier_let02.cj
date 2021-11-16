// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

// let
open class A {
    open prop let i: Int64 {
        get() { return 0 }
    }
}
class B <: A {
    override prop let i: Int64 {  // EXPECTED: regex error.*?property must have accessors
 
    }
}

func main():Int64 {
    A().i
    B().i
    return 0
}
