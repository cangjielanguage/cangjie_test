// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex enum type must be toplevel
func test(): Int64 {
    var i : Int32 = 1
    match (i) {
        case _ => enum Timeunit { Year }
    }
    return 0
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
