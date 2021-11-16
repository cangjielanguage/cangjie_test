// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: scan condition type of this match case is not Boolean
func test(): Int64 {
    var i : Int32 = 50
    let scorePass: Set<Int32> = #{60, 70, 80, 90, 100}
    match {
        case i in $scorePass => "pass"
        case _ => "default"
    }
    return 0
}

func main(): Int64 {
    return test()
}
