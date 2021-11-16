// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'int08'
// ASSERT: regex 0

func main(): Int64 {
    var int8_Low_Median_One: int08 = 127
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
