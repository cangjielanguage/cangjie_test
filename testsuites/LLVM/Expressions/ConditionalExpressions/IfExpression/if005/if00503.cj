// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'elseif'
func main(): Int64 {
    if (true) {}
    elseif (true) {}
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
