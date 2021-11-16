// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex backquote identifier is empty
func test(): Int64 {
    var i : Int32 = 0
    match (i) {
        case ``=> 1
    }
    return 1
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
