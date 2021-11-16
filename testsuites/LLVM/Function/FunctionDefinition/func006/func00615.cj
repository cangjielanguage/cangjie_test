// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex function declaration must have function body

func test()

func main(): Int32 {
    test()
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
