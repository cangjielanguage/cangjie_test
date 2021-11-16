// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int32 {
    package test        // EXPECTED: regex 'package' is not allowed in block, expected expression or declaration here
    return i
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
