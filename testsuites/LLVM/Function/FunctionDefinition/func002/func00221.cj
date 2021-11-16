// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex illegal backquote identifier
func `te st`(): Int64 {
    return 1
}

func main(): Int64 {
    return `te st`()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
