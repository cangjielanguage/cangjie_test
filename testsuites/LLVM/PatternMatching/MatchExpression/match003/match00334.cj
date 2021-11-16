// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'i_in_main'
func test(): Int64 {
    var i : Int32 = 1
    match (i) {
        case _ => i_in_main
    }
    return 0
}

func main(): Int64 {
    var i_in_main : Int32 =1
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
