// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call 'test'
func test(a:Int32,b:Int32,c:Int32){return 1}

func main(): Int64 {
    return test(a=0,0,0)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
