// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    let a: Int32 = 1
    let b: Int32 = 2
    init( a: Int32, b: Int32) {
        this.a = a
        this.b = b
    }
}

func test(): Test{
    Test(5,6)
}

func main(): Int64 {
    if test().a != 5 || test().b != 6 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace