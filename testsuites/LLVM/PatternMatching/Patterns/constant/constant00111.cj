// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto at least one default case, such as wildcard pattern, variable pattern or '[...]' for sequence pattern in match case

func test(): Int64 {
    var i : Int32 = 0
    var res = match (i) {
        case 1 => 1
        case 2 => 2
        case 3 => 3
    }
    if (res != 0) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
