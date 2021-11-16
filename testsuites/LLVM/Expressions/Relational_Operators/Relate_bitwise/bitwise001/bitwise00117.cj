// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a:Int64 = 10
    var b:Int64 = 0
    //b = !if
    b = !else       // EXPECTED: regex illegal expression on the right of '=', which must be conventional expression
    //b = !then
    //b = !int
    return 1
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
