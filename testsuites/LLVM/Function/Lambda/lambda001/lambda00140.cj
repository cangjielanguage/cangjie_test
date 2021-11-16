// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex  enum type must be toplevel
func test(): Int64 {
    enum Timeunit {a}
    let sum = { a: Timeunit => a}
    return 0
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
