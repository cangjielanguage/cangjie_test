// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex redefinition of declaration 'a'
func test(): Int64 {
    let sum = { a: Int32, a: Int32 => a + a}
    return 0
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
