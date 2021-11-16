// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex 'interface' is not allowed in block, expected expression or declaration here
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    if (true) {
        interface test{}
        return 0
    }
    return 1
}
