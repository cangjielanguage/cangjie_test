// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f

enum Timeunit {
            Year | Month | Day | Hour
       }

func test(): String{    // // ASSERT: regex type of return expression is incompatible with return type
    Timeunit.Year
}

func main(): Int64 {
    test()

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace