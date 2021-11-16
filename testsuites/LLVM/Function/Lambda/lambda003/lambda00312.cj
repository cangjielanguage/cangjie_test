// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'sum'
func test(): Int64 {
    let sum = { a:Int64, b:Int64 => a + b}
    return 0
}

func main(): Int64 {
    test()
    return sum(0,0)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
