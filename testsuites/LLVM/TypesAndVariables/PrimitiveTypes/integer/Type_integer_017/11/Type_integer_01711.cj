// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'a127'

func main(): Int64 {
    let uint64_A: UInt64 = a127
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
