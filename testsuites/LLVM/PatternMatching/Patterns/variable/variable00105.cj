// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto at least one default case, such as wildcard pattern, variable pattern or '[...]' for sequence pattern in match case
func test(): Int64 {
    var i : Int32 = 0
    match (i) {
        case 0 => 1
    }
    return 0
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
