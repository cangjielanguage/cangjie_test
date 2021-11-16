// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected block begin with '\{'
// ASSERT: regex expected an expression of type 'Bool', but got
func main(): Int64 {
    if (if (true)) {
        return 0
    }
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
