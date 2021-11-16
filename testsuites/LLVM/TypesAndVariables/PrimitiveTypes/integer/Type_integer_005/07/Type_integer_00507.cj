// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'int321'
// ASSERT: regex 0

func main(): Int64 {
    var int32_One: int321 = 127
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
