// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main(): Int64 {
    var MyTuple : Option<Int32>*Option<Int32> = (S<Int32> = (100),Some<Int32>(100))     // EXPECTED: regex undeclared identifier 'S'
    return 0
}