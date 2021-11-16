// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex illegal backquote identifier
func test(): Int64 {
    var i : Int32 = 0
    match (i) {
        case test` => 1
    }
    return 1
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
