// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: scan condition type of this match case is not Boolean
func test(): Int64 {
    let i = (("Allen", 90), ("Jack", 60))
    match {
        case i in ((_, _), secondStudent@ (_, _)) => "The info of the second student is: ${secondStudent[0]} got ${secondStudent[1]}"
        case _ => "default"
    }
    return 0
}

func main(): Int64 {
    return test()
}
