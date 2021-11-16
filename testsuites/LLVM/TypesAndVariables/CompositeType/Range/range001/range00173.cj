// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex step cannot be zero in range expression
func main(): Int64 {
    let a = 0..1:0
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
