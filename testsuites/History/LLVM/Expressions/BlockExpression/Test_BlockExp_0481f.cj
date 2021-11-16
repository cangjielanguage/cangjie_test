// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f

func test(): Int32{    // ASSERT: regex type of return expression is incompatible with return type
    var a : Int32*Float32 = (1, 1.1)
    a
}

func main(): Int64 {
    test()

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace