// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected type begin with '\:' in function parameter
func test(te st:Int64): Int64 {
    return te st
}

func main(): Int64 {
    return test(0)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
