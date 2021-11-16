// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f

func test(): Int8{    // // ASSERT: regex type of return expression is incompatible with return type
    var a: Float16 = 1.0
    a
}

func main(): Int64 {
    test()

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace