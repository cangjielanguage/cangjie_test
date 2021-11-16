// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex cannot assign to value
func main(): Int64 {
    let a = 0..10:1
    a = 0..5
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
