// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
    static let test : Int32 = 1
}

class Data <: Base {
    
}

func main(): Int64 {
    Data.test = 2 // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
    return Int64( Data.test - 2 )
}