// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto array init expression must has type (Int64)->T
func main(): Int64{
    let a = Array<Int32>(5,0.5)
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
