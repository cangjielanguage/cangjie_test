// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex calling object is not a function or constructors
func test(){return 0}

func main(): Int32 {
    test()()
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
