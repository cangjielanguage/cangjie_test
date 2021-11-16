// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'abc'

func main(): Int64 {
    let int32_A: Int32 = abc
    0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
