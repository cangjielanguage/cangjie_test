// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex missing argument for call with parameter list
func test(): Int64 {
    let sum = { a:Int64, b:Int64 => a + b}
    var i : Int64 = 0
    return sum(i)
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
