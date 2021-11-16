// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
func main(): Int64{
    var b : Int32 = 1
    let a = Array<Int32>(5,b++) // EXPECTED: regex-auto array init expression must has type (Int64)->T
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
