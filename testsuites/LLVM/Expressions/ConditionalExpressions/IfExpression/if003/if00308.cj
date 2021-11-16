// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex enum type must be toplevel
func main(): Int64 {
    if (true) {
        enum Timeunit {
            Year | Month | Day | Hour
        }
        return 0
    }
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
