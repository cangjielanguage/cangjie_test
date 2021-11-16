// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func test(): Int64 {
    var i = 0
    match { //  EXPECTED: regex error.*?type incompatible in this MatchCase
        case i == 0 => "0"
        case i != 0 => 1
        case _ => "default"
    }
    return 0
}

func main(): Int64 {
    return test()
}
