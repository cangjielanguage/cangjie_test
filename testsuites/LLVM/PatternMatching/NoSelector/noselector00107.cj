// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: scan condition type of this match case is not Boolean
func test(): Int64 {
    let i = ("Allen", 90)
    match {
        case i in ("Bob", 90) => "Bob got 90"
        case _ => "default"
    }
    return 0
}

func main(): Int64 {
    return test()
}
