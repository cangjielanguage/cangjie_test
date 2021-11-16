// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex redefinition of declaration 'test'
type test = Int64
func test(a : test): Int64 {
    return 0
}

func main(): Int64 {
    var a : test = 1
    return test(a)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
