// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'mytype'
func test(): mytype {
    let a : mytype = 0
    return a
}

func main(): Int32 {
    test()
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
