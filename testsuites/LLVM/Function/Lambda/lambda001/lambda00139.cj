// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex 'record' is not allowed in block, expected expression or declaration here
func test(): Int64 {
    record myRecord{}
    let sum = { a: myRecord => a}
    return 0
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
