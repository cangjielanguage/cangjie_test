// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'int160'
// ASSERT: regex 0

func main(): Int64 {
    var int16_One: int160 = 127
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
