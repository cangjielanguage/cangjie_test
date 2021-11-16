// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'INT8'

func main(): Int64 {
    let int8_Low_Median_One: INT8 = 127
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
