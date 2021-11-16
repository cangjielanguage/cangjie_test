// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected function name after \'func\'
func 1_test(): Int64 {
    return 0
}

func main(): Int64 {
    return 1_test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
