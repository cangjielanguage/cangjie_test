// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex  no matching function declaration for function call
func test(a : Int64){return 0}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
