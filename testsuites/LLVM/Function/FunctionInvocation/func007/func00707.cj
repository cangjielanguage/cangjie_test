// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'test0'
func test(a : Int32){return 0}

func main(): Int64 {
    return test0()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
