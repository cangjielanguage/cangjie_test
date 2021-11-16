// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected '=>' after pattern in case body
func test(): Int64 {
    var i : Int32 = 0
    match (i) {
        case _ | _  => "0"
    }
    return 0
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
