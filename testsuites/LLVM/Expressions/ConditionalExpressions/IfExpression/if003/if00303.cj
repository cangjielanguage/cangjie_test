// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected block begin with \'{\'
func main(): Int64 {
    if (true)
        return 0
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
