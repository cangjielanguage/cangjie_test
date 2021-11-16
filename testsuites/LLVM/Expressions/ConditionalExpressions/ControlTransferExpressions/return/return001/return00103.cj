// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'RETURN'
func main(): Int64 {
    RETURN 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
