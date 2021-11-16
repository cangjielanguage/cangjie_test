// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'abc'

func main(): Int64 {
    var uint8_var_A: UInt8 = abc
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
