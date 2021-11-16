// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f

func test(): Int64{    // ASSERT: regex type of return expression is incompatible with return type
    var optionalint1: Option<Int32> = Some<Int32>(100)
    optionalint1
}

func main(): Int64 {
    test()

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace