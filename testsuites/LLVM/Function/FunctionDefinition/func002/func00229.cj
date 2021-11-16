// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex illegal object
func test`test`test(): Int64 {
    return 1
}

func main(): Int64 {
    return test`test`test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
