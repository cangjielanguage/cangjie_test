// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected function parameters after function name
func te st(): Int64 {
    return 0
}

func main(): Int64 {
    return te st()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
