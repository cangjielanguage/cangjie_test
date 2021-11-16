// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected identifier here
func test(1test:Int64): Int64 {
    return 1test
}

func main(): Int64 {
    return test(1)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
