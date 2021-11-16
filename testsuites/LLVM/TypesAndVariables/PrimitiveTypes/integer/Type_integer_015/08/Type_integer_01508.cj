// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'uin32'

func main(): Int64 {
    let uint32_One: uin32 = 127
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
