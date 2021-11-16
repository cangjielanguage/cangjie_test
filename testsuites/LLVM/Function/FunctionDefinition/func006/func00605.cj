// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'a'
func test(): Int64{
    var a : Int64 = 0
    return a
}

func main(): Int64 {
    return a
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
