// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex illegal backquote identifier
func `1_test`(): Int64 {
    return 1
}

func main(): Int64 {
    return `1_test`()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
