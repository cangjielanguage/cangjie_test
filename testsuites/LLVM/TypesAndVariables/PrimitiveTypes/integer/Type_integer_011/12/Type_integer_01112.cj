// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'a128'

func main(): Int64 {
    var uint8_var_A: UInt8 = a128
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
