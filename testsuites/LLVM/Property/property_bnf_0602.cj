// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class Boo{
    prop let a1:Int64 {} // EXPECTED: regex property must have accessors
}
class Coo <: Boo {
}

