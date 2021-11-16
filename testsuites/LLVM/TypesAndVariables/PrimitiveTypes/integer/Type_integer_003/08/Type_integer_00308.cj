// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'in16'

func main(): Int64 {
    let int16_One: in16 = 127
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
