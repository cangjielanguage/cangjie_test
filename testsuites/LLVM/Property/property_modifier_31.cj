// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class Boo{
    open prop func foo(){} // EXPECTED: regex invalid property declaration
}

class Coo <: Boo{
    override prop func foo(){} // EXPECTED: regex invalid property declaration
}
