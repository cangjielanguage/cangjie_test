// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected '=>' in the lambda function
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(): Int64 {
    let addCurried = { a: Int32)(b: Int32 => a+b}
    return 0
}

func main(): Int64 {
    return test()
}