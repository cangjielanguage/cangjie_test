// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'abc'

func main(): Int64 {
    let uint16_A: UInt16 = abc
    0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
