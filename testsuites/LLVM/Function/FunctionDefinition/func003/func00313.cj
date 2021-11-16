// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected identifier here
func test(_1:Int64): Int64 {
    return _1
}

func main(): Int64 {
    return test(0)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
