// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex missing argument for call with parameter list
func test(): Int64 {
    var sum = { f: (Int64, Int64) -> Int64, a: Int64, b: Int64 => f(a, b)}
    func myfunc(a : Int64, b : Int64):Unit{return}
    sum(myfunc(0,0))
    return 1
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
