// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'i_out'
func test(): Int64 {
    let myLambda = { i_in : Int64 =>
        i_in = i_out
        return i_in
    }
    return 1
}

func main(): Int64 {
    var i_out : Int64 = 0
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
