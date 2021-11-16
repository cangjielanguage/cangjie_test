// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier \'IF\'
func main(): Int64 {
    IF true {
        return 0
    }
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
