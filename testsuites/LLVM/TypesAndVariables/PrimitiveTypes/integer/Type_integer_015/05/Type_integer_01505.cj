// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'UInt'

func main(): Int64 {
    let uint32_One: UInt 32 = 2147483647

    if (uint32_One == u2147483647) {
        return 1
    } else {
        return 0
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
