// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: scan condition type of this match case is not Boolean
func test(): Int64 {
    let i: List<Int32> = [50, 60, 70, 80, 90]
    match {
        case i in List{..., 90} => "the highest score is 90"
        case _ => "default"
    }
    return 0
}

func main(): Int64 {
    return test()
}
