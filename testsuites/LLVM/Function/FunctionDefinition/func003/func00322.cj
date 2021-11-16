// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex illegal backquote identifier
func test(`_test`:Int64): Int64 {
    return `_test`
}

func main(): Int64 {
    return test(1)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
