// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f

record Test {
                let a: Int32 = 1
                let b: Int32 = 2
}

func test(): Int64{    // // ASSERT: regex type of return expression is incompatible with return type
    Test(5,6)
}

func main(): Int64 {
    test()

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace