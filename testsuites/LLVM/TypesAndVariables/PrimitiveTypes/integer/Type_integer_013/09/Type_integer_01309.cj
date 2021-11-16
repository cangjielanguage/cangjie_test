// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'UINT16'

func main(): Int64 {
    let int16_One: UINT16 = 127
    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
