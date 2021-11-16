// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'in64'

func main(): Int64 {
    let int64_One: in64 = 127
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
