// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected an expression of type 'Bool', but got
func main(): Int64 {
    while ("true") {
        return 1
    }
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
