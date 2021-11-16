// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: scan condition type of this match case is not Boolean
func test(): Int64 {
    enum TimeUnit1 { Year
                    | Month
                    | Day
                    | Hour
    }
    let i = Year
    match {
        case i == Year => "use Year as timeUnit"
        case _ => "default"
    }
    return 0
}

func main(): Int64 {
    return test()
}
