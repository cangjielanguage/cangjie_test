// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'UINT8'

func main(): Int64 {
    let uint8_Low_Median_One: UINT8 = 127
    0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
