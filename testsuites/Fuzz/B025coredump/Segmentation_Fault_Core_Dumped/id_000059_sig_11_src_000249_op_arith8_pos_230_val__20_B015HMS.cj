// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var a : Option<Int32> = .Some<Int32>(1)
    var b : Option<Int32> = .None<Int32>
    let myArray0 : Array<Option<Int32>> = @{a,b,.S[me<Int32>(0)}
    return 0
}

