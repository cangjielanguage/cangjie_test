// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'a127'

func main(): Int64 {
    let uint16_A: UInt16 = a127
    0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
