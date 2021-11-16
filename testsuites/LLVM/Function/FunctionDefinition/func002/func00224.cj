// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex illegal backquote identifier
func `_1`(): Int32 {
    return 1
}

func main(): Int64 {
    return `_1`()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
