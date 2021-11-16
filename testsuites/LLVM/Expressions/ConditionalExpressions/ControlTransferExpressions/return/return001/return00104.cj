// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'return0'
func main(): Int64 {
    return0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
