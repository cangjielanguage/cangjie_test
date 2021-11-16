// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface Data{
    static func foo (a: Int64) : Int32{
        return 1
    }
}

interface Data2{
    static func foo (a: Int64) : Int64{
        return 1
    }
}

class Test <: Data & Data2 { // EXPECTED: regex return types for function 'foo' are incompatible
    
}

func main(): Int64 {
    return 0
}