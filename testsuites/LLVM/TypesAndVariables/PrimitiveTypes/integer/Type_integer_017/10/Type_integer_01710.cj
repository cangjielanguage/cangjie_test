// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'abc'

func main(): Int64 {
    let uint64_A: UInt64 = abc
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
