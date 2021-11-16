// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex generic type should be used with type argument
func test(): Int64 {
    var i : Range = 0..10
    match (i) {
        case _ => 0
    }
    return 0
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
