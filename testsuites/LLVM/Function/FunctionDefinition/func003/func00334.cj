// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex redefinition of declaration 'test'
func test(test:Int64, test:Int64): Int64 {
    return test + test
}

func main(): Int64 {
    return test(0,0)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
