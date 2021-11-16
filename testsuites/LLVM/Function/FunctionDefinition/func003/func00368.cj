// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex 'test' is not a type
func test(a : test): Int64 {
    return 0
}

func main(): Int64 {
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
