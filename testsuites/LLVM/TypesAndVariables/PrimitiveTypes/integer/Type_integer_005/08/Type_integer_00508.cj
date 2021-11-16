// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'in32'

func main(): Int64 {
    let int32_One: in32 = 127
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
