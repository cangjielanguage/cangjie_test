// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'Return'
func main(): Int64 {
    Return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
