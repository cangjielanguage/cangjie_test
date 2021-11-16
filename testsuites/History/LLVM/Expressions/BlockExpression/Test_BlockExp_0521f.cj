// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f

class Data {
    var data: Int32 = 1
}

func test(): Int64{    // // ASSERT: regex type of return expression is incompatible with return type
    Data()
}

func main(): Int64 {
    test()

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace