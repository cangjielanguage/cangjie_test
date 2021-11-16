// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex enum type must be toplevel

func main(): Int32 {
    enum Timeunit {Year}
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
