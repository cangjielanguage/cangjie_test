// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex invalid condition expr after 'if'
func main(): Int64 {
    if (Int32) {
        return 1
    }
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
