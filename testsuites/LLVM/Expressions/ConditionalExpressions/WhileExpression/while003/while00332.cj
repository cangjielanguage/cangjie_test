// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-auto 'class' is not allowed in block, expected expression or declaration here
func main(): Int64 {
    while (true) {
        class test {}
        return 0
    }
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
