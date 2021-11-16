// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f

func test(): Int64{    // // ASSERT: regex type of return expression is incompatible with return type
    func returnAdd(a: Int64, b: Int64):(Int64, Int64)->Int64 {
        return { a: Int64, b: Int64 => a + b}
    }
    returnAdd(2,3)
}

func main(): Int64 {
    test()

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace