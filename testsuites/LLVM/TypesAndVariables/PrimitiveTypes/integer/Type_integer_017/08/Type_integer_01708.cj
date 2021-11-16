// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'uin64'

func main(): Int64 {
    let uint64_One: uin64 = 127
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
