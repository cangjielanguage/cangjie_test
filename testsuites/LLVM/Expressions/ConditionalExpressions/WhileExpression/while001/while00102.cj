// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'whi'
func main(): Int64 {
    whi le true {
        return 0
    }
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
