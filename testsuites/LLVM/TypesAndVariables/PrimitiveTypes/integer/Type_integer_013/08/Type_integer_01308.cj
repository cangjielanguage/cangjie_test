// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'unt16'

func main(): Int64 {
    let uint16_One: unt16 = 127
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
