// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex illegal backquote identifier
func test(`1test`:Int64): Int64 {
    return `1test`
}

func main(): Int64 {
    return test(1)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
