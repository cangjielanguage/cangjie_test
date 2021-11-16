// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex illegal backquote identifier
func `@`(): Int32 {
    return 1
}

func main(): Int64 {
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
