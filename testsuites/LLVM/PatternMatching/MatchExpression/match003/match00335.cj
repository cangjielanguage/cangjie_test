// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex const pattern is not matched
func test(): Int64 {
    var i : Int32 = 1
    match (i) {
        case "1" => 1
        case _ => -1
    }
    return 1
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
