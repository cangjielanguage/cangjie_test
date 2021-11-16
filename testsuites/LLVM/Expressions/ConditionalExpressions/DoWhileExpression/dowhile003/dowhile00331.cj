// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
func main(): Int64 {
    do {
        package test // EXPECTED: regex 'package' is not allowed in block, expected expression or declaration here
        return 0
    } while (true)
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
