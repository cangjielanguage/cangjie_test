// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex redefinition of declaration 'a'
func test(a : Int64, a : Int64): Int64 {
    return 0
}

func main(): Int64 {
    return test(0,0)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
