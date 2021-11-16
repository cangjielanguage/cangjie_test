// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-auto  expected ',' to separate or ')' to close
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(): Int64 {
    let sum = { (a: Int64, b: Int64 => a + b}
    return 0
}

func main(): Int64 {
    return test()
}
