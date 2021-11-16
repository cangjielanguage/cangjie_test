// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex illegal backquote identifier
func test(test`:Int32): Int32 {
    return test`
}

func main(): Int64 {
    return test(0)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
